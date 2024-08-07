import 'package:paddle_trac_admin_dashboard/infrastructure/config/app_environment.dart';

class EnvironmentConfig {
  static AppEnvironment appEnvironment = AppEnvironmentString.fromString(
    const String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'production',
    ),
  );
}
