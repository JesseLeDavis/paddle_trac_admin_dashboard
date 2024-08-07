import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firefuel/firefuel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/config/app_environment.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/config/environment_config.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';

class AppBlocObserver extends BlocObserver {
  final _logger = Logger();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.i('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  FutureOr<void> Function()? initializeFirebase,
  Logger? logger,
}) async {
  logger ??= Logger();
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase?.call();

  Firefuel.initialize(FirebaseFirestore.instance);

  configureDependencies(EnvironmentConfig.appEnvironment.toFormattedString());

  // FlutterError.onError = (details) {
  //   logger!.e(details.exceptionAsString(), details.exception, details.stack);
  // };

  await runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();

      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
