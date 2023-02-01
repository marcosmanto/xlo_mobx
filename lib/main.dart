import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/stores/category_store.dart';
import 'stores/create_store.dart';
import 'stores/login_store.dart';
import 'stores/user_manager_store.dart';

import 'screens/base/base_screen.dart';
import 'secret.dart';
import 'stores/page_store.dart';
import 'stores/signup_store.dart';

const double gCircularProgressStrokeWidh = 2.75;
const bool gDebug = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    appId,
    'https://parseapi.back4app.com/',
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton<PageStore>(PageStore());
  GetIt.I.registerSingleton<LoginStore>(LoginStore());
  GetIt.I.registerSingleton<SignupStore>(SignupStore());
  GetIt.I.registerSingleton<UserManagerStore>(UserManagerStore());
  GetIt.I.registerSingleton<CreateStore>(CreateStore());
  GetIt.I.registerSingleton(CategoryStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData();
    return MaterialApp(
      title: 'XLO',
      theme: themeData.copyWith(
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(elevation: 0),
        colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.cyanAccent[200],
        ),
      ),
      home: BaseScreen(),
    );
  }
}
