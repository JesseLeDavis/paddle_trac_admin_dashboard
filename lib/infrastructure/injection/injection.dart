import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.config.dart';

// Project imports:

final getIt = GetIt.instance;
final getItAsync = GetIt.instance.getAsync;

///use on injected classes
///
///`@dev`
// ignore: unused_element
const _dev = Environment('dev');

///use on injected classes
///
///`@prod`
// ignore: unused_element
const _prod = Environment('prod');

@injectableInit
void configureDependencies(String environment) =>
    getIt.init(environment: environment);
