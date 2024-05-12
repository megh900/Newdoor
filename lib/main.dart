import 'package:first/constants.dart';
import 'package:first/preference/pref_utils.dart';
import 'package:first/routes/app_route.dart';
import 'package:first/theme.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: appTheme(),
      initialRoute: AppRoute.splashScreen,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
