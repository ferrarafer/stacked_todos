import 'package:flutter/material.dart';
import 'package:todos/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/enums/snackbar_type.dart';

void setupSnackbarUi() {
  final snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.custom,
    config: SnackbarConfig(
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      borderRadius: 1,
      dismissDirection: DismissDirection.vertical,
    ),
  );
}
