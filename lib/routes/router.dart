import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/routes/app_routes.dart';
import 'package:paddle_trac_admin_dashboard/routes/paths/paths.dart';

@injectable
class AppRouter {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  final ValueKey<String> scaffoldKey = const ValueKey<String>('scaffold');

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      if (isLoggedIn) {
        if (state.matchedLocation == signInPath) {
          return dashboardPath;
        }
      } else {
        if (state.matchedLocation == dashboardPath) {
          return signInPath;
        }
      }
      return null;
    },
    initialLocation: signInPath,
    errorBuilder: (context, state) => const Center(
      child: Text('error'),
    ),
    routes: appRoutes(),
  );
}
