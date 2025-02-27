import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paddle_trac_admin_dashboard/constants/sizes.dart';
import 'package:paddle_trac_admin_dashboard/features/home_page/cubit/cubit/home_page_cubit.dart';
import 'package:paddle_trac_admin_dashboard/features/orders/orders_page.dart';
import 'package:paddle_trac_admin_dashboard/features/profile_page/profile_page.dart';
import 'package:paddle_trac_admin_dashboard/features/settings/setting_page.dart';
import 'package:paddle_trac_admin_dashboard/features/sticker_generator/sticker_generator_page.dart';
import 'package:paddle_trac_admin_dashboard/gen/assets.gen.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomePageCubit>(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.green,
          ),
          child: Scaffold(
            body: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: CircularProgressIndicator.new,
                  loaded: (loaded) {
                    final isQrPage =
                        loaded.dashboardPageState == DashboardPageState.qr;
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [Assets.icons.logo.svg()],
                              ),
                            ),
                          ),
                          gapH16,
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          color: ColorThemes.primary,
                                          size: 30,
                                          Icons.description_outlined,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HomePageCubit>()
                                              .changePage(
                                                DashboardPageState.orders,
                                              );
                                        },
                                      ),
                                      gapH24,
                                      IconButton(
                                        icon: const Icon(
                                          color: ColorThemes.lightGrey,
                                          size: 30,
                                          Icons.person,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HomePageCubit>()
                                              .changePage(
                                                DashboardPageState.profile,
                                              );
                                        },
                                      ),
                                      gapH24,
                                      // IconButton(
                                      //   icon: Icon(
                                      //     color: isQrPage
                                      //         ? ColorThemes.primary
                                      //         : ColorThemes.lightGrey,
                                      //     size: 30,
                                      //     Icons.qr_code_scanner_rounded,
                                      //   ),
                                      //   onPressed: () {
                                      //     context
                                      //         .read<HomePageCubit>()
                                      //         .changePage(
                                      //           DashboardPageState.qr,
                                      //         );
                                      //   },
                                      // ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(
                                          color: ColorThemes.lightGrey,
                                          size: 30,
                                          Icons.settings,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HomePageCubit>()
                                              .changePage(
                                                DashboardPageState.settings,
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                gapW12,
                                Expanded(
                                  child: getDashBoardScreen(
                                    loaded.dashboardPageState,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget getDashBoardScreen(DashboardPageState dashboardPageState) {
    switch (dashboardPageState) {
      case DashboardPageState.orders:
        return const OrdersPage();
      case DashboardPageState.profile:
        return const ProfilePage();
      case DashboardPageState.settings:
        return const SetttingsPage();
      case DashboardPageState.qr:
        return const StickerGeneratorPage();
    }
  }
}
