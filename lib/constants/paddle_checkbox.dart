import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paddle_trac_admin_dashboard/gen/assets.gen.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';


class PaddleCheckBox extends StatefulWidget {
  const PaddleCheckBox({
    Key? key,
    required this.isSelected,
    required this.onTapCallback,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTapCallback;

  @override
  State<PaddleCheckBox> createState() => _PaddleCheckBoxState();
}

class _PaddleCheckBoxState extends State<PaddleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSelected
              ? ColorThemes.courtGreen
              : ColorThemes.lightGrey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: widget.isSelected ? ColorThemes.courtGreen : Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            widget.onTapCallback();
          },
          borderRadius: BorderRadius.circular(6),
          child:
              Transform.scale(scale: .7, child: Assets.icons.checkmark.svg()),
        ),
      ),
    );
  }
}
