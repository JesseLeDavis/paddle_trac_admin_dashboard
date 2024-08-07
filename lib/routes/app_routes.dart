import 'package:go_router/go_router.dart';
import 'package:paddle_trac_admin_dashboard/features/home_page/home_page.dart';
import 'package:paddle_trac_admin_dashboard/features/sign_in/sign_in_page.dart';
import 'package:paddle_trac_admin_dashboard/routes/paths/paths.dart';

List<GoRoute> appRoutes() {
  return [
    GoRoute(
      path: dashboardPath,
      name: dashboardPath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: signInPath,
      name: signInPath,
      builder: (context, state) => const SignInPage(),
    ),
  ];
}
