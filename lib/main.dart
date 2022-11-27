import 'package:flutter/material.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/ui/setup/setup_bottom_sheet_ui.dart';
import 'package:todos/ui/setup/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/ui/setup/setup_snackbar_ui.dart';

import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  setupSnackbarUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoMVVM with Stacked',
      theme: ThemeData.dark(),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
