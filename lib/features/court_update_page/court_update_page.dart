import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paddle_trac_admin_dashboard/app/view/app.dart';
import 'package:paddle_trac_admin_dashboard/constants/paddle_checkbox.dart';
import 'package:paddle_trac_admin_dashboard/features/court_update_page/cubit/court_update_cubit.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';
import 'package:paddle_trac_admin_dashboard/models/court/court.model.dart';
import 'package:paddle_trac_admin_dashboard/models/court_update_request/court_update_request.model.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';

class CourtUpdatePage extends StatelessWidget {
  const CourtUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CourtUpdateCubit>()..fetchRequests(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Court Update Requests',
              style: context.bodyBold,
            ),
          ),
        ),
        body: BlocBuilder<CourtUpdateCubit, CourtUpdateState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const Center(child: CircularProgressIndicator()),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              error: (e) => Center(child: Text('Error: ${e.message}')),
              loaded: (l) {
                if (l.requests.isEmpty) {
                  return const Center(child: Text('No requests.'));
                }
                return Row(
                  children: [
                    // ─── Left: request list ─────────────────────
                    Container(
                      width: 280,
                      color: Colors.grey[50],
                      child: ListView.builder(
                        itemCount: l.requests.length,
                        itemBuilder: (ctx, i) {
                          final req = l.requests[i];
                          return ListTile(
                            selectedColor: ColorThemes.courtGreen,
                            title: Text(req.courtId),
                            subtitle: Text('By ${req.submittedBy}'),
                            selected: req == l.selectedRequest,
                            onTap: () => context
                                .read<CourtUpdateCubit>()
                                .selectRequest(req),
                          );
                        },
                      ),
                    ),
                    const VerticalDivider(width: 1),

                    // ─── Right: two‑column review ─────────────────
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft, // ← align child to top
                        child: () {
                          if (l.selectedRequest == null) {
                            return Center(
                              child: Text(
                                'Tap a request to review changes',
                                style: context.bodyBold,
                              ),
                            );
                          }
                          if (l.isCourtLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (l.courtLoadError != null) {
                            return Center(
                              child: Text('Error: ${l.courtLoadError}'),
                            );
                          }
                          return _buildTwoColumnReview(
                            context,
                            l.selectedRequest!,
                            l.selectedCourt!,
                          );
                        }(),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTwoColumnReview(
    BuildContext context,
    CourtUpdateRequest req,
    Court court,
  ) {
    final origJson = court.toJson();
    final updates = req.requestedUpdates;

    final allAmenities = [
      'Portable Nets',
      'Perm. Nets',
      'BYO Nets',
      'Tennis Nets',
      'Restrooms',
      'Food and Drinks',
      'Trainers & Lessons',
      // etc—match your _amenityList
    ];

    final origCourtsCount = int.tryParse(court.courts.split(' ').first) ?? 0;

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Original Court Info ─────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Name: ',
                        style: context.bodyBold,
                      ),
                      TextSpan(
                        text: origJson['name'] ?? '',
                        style: context.body,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Address: ', style: context.bodyBold),
                      TextSpan(
                        text: origJson['address'] ?? '',
                        style: context.body,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Website: ', style: context.bodyBold),
                      TextSpan(
                        text: origJson['website'] ?? '',
                        style: context.body,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Nets: ', style: context.bodyBold),
                      TextSpan(text: court.nets, style: context.body),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Courts: ', style: context.bodyBold),
                      TextSpan(text: '$origCourtsCount', style: context.body),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Status: ', style: context.bodyBold),
                      TextSpan(text: court.pubOrPriv, style: context.body),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Amenities:',
                  style: context.bodyBold,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: allAmenities
                      .where((a) => court.amenities.contains(a))
                      .map(
                        (a) => Chip(
                          label: Text(a),
                          shape: const StadiumBorder(
                            side: BorderSide(color: ColorThemes.primary),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          const SizedBox(width: 32),

          // ─── Requested Changes ───────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Requested Changes',
                  style: context.headlineBold,
                ),
                const SizedBox(height: 12),
                if (updates.containsKey('name'))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      initialValue: updates['name'].toString(),
                      decoration:
                          const InputDecoration(labelText: 'Requested Name'),
                      onChanged: (v) => context
                          .read<CourtUpdateCubit>()
                          .updateReviewField('name', v),
                    ),
                  ),
                if (updates.containsKey('address'))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      initialValue: updates['address'].toString(),
                      decoration:
                          const InputDecoration(labelText: 'Requested Address'),
                      onChanged: (v) => context
                          .read<CourtUpdateCubit>()
                          .updateReviewField('address', v),
                    ),
                  ),
                if (updates.containsKey('website'))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      initialValue: updates['website'].toString(),
                      decoration:
                          const InputDecoration(labelText: 'Requested Website'),
                      onChanged: (v) => context
                          .read<CourtUpdateCubit>()
                          .updateReviewField('website', v),
                    ),
                  ),
                if (updates.containsKey('nets'))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Requested Nets'),
                      ...[
                        'Portable Nets',
                        'Perm. Nets',
                        'BYO Nets',
                        'Tennis Nets',
                      ].map((opt) {
                        return RadioListTile<String>(
                          contentPadding: const EdgeInsets.only(right: 30),
                          title: Text(opt),
                          value: opt,
                          groupValue: updates['nets'] as String?,
                          onChanged: (v) {
                            if (v != null) {
                              context
                                  .read<CourtUpdateCubit>()
                                  .updateReviewField('nets', v);
                            }
                          },
                        );
                      }).toList(),
                    ],
                  ),
                if (updates.containsKey('courts'))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const Text('Requested Courts'),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => context
                              .read<CourtUpdateCubit>()
                              .decrementCourts(),
                        ),
                        Text(
                          (int.tryParse(
                                    (updates['courts'] as String)
                                        .split(' ')
                                        .first,
                                  ) ??
                                  origCourtsCount)
                              .toString(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => context
                              .read<CourtUpdateCubit>()
                              .incrementCourts(),
                        ),
                      ],
                    ),
                  ),
                if (updates.containsKey('pubOrPriv'))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Requested Status'),
                      ...['Public', 'Private', 'Members', 'Fee'].map((opt) {
                        return RadioListTile<String>(
                          contentPadding: const EdgeInsets.only(right: 30),
                          title: Text(opt),
                          value: opt,
                          groupValue: updates['pubOrPriv'] as String?,
                          onChanged: (v) {
                            if (v != null) {
                              context
                                  .read<CourtUpdateCubit>()
                                  .updateReviewField('pubOrPriv', v);
                            }
                          },
                        );
                      }).toList(),
                    ],
                  ),
                if (updates.containsKey('amenities'))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Requested Amenities'),
                      const SizedBox(height: 8),
                      ...allAmenities.map((amenity) {
                        final selectedList =
                            (updates['amenities'] as List).cast<String>();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              PaddleCheckBox(
                                isSelected: selectedList.contains(amenity),
                                onTapCallback: () => context
                                    .read<CourtUpdateCubit>()
                                    .toggleReviewAmenity(amenity),
                              ),
                              const SizedBox(width: 8),
                              Text(amenity),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorThemes.courtGreen,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () =>
                          context.read<CourtUpdateCubit>().approveRequest(req),
                      child: const Text('Approve'),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorThemes.alert,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () =>
                          context.read<CourtUpdateCubit>().denyRequest(req),
                      child: const Text('Deny'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
