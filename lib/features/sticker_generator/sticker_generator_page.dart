import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:paddle_trac_admin_dashboard/app/view/app.dart';
import 'package:paddle_trac_admin_dashboard/collections/partner_buissness.dart';
import 'package:paddle_trac_admin_dashboard/constants/sizes.dart';
import 'package:paddle_trac_admin_dashboard/features/sticker_generator/cubit/sticker_generator_cubit.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';

class StickerGeneratorPage extends StatelessWidget {
  const StickerGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StickerGeneratorCubit>(),
      child: const StickerGeneratorView(),
    );
  }
}

class StickerGeneratorView extends StatefulWidget {
  const StickerGeneratorView({super.key});

  @override
  _StickerGeneratorViewState createState() => _StickerGeneratorViewState();
}

class _StickerGeneratorViewState extends State<StickerGeneratorView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      // Remove all non-digit characters
      final newText = text.replaceAll(RegExp(r'[^\d]'), '');
      // Format number with commas
      if (newText.isNotEmpty) {
        final number = int.parse(newText);
        final formattedNumber = NumberFormat('#,###').format(number);
        // Update the controller's text without triggering another listener
        _controller.value = _controller.value.copyWith(
          text: formattedNumber,
          selection: TextSelection.collapsed(offset: formattedNumber.length),
          composing: TextRange.empty,
        );
      }
    });
  }

  PartnerBusiness buttonValue = partnerBuisiness.first;
  String textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    final companyList = <DropdownMenuItem>[];
    for (final company in partnerBuisiness) {
      companyList.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sticker Generater 5000',
              style: context.largeTitle,
            ),
            gapH24,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  items: companyList,
                  onChanged: (_) {
                    setState(() {
                      buttonValue = _;
                    });
                  },
                  value: buttonValue,
                ),
                gapW24,
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        textFieldValue = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.one_x_mobiledata),
                      labelText: 'Sticker Quantity',
                    ),
                  ),
                ),
                gapW24,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: ColorThemes.primary,
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorThemes.primary,
                    ),
                    onPressed: () {
                      context.read<StickerGeneratorCubit>().generateCSV(
                            business: buttonValue,
                            stickerCount:
                                int.parse(textFieldValue.replaceAll(',', '')),
                          );
                      // _showConfirmationDialog(
                      //   context,
                      //   buttonValue,
                      //   textFieldValue,
                      // );
                    },
                    child: Text('Generate $textFieldValue Stickers'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Future<bool> _showConfirmationDialog(
    BuildContext context,
    PartnerBusiness selectedBuisness,
    String stickerCount,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  gapH24,
                  Text(
                    'Are you sure you want to generate $stickerCount for ${selectedBuisness.name}',
                    style: context.callout.copyWith(color: Colors.black),
                  ),
                  gapH24,
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorThemes.courtGreen,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'Yes',
                          style: context.bodyBold.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  gapH12,
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorThemes.alert,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'No',
                          style: context.bodyBold.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ) ??
        false;
  }
}
