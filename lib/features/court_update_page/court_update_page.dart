import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paddle_trac_admin_dashboard/features/court_update_page/cubit/court_update_cubit.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';

class CourtUpdatePage extends StatelessWidget {
  const CourtUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CourtUpdateCubit>()..fetchRequests(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Court Update Requests')),
        body: BlocConsumer<CourtUpdateCubit, CourtUpdateState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (msg) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Error: $msg'))),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const Center(child: CircularProgressIndicator()),
              initial: (_) => const Center(child: CircularProgressIndicator()),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text('Error: $msg')),
              loaded: (loaded) {
                if (loaded.requests.isEmpty) {
                  return const Center(child: Text('No update requests.'));
                }
                return ListView.builder(
                  itemCount: loaded.requests.length,
                  itemBuilder: (context, i) {
                    final req = loaded.requests[i];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ExpansionTile(
                        title: Text('Court ID: ${req.courtId}'),
                        subtitle: Text('Submitted by: ${req.submittedBy}'),
                        children: [
                          // Requested updates
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Requested Updates:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ...req.requestedUpdates.entries.map(
                                  (e) => Text('${e.key}: ${e.value}'),
                                ),
                              ],
                            ),
                          ),
                          // Approve / Deny buttons
                          OverflowBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => context
                                    .read<CourtUpdateCubit>()
                                    .denyRequest(req),
                                child: const Text('Deny'),
                              ),
                              ElevatedButton(
                                onPressed: () => context
                                    .read<CourtUpdateCubit>()
                                    .approveRequest(req),
                                child: const Text('Approve'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
