import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:paddle_trac_admin_dashboard/app/view/app.dart';
import 'package:paddle_trac_admin_dashboard/bootstrap.dart';
import 'package:paddle_trac_admin_dashboard/firebase_options.dart';

void main() {
  usePathUrlStrategy();
  bootstrap(
    builder: () => const App(),
    initializeFirebase: () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    },
  );
}
