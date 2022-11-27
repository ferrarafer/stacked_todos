import 'package:todos/app/app.locator.dart';
import 'package:todos/enums/dialog_type.dart';
import 'package:todos/ui/dialogs/custom_dialog/custom_dialog.dart';
import 'package:todos/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<dynamic, DialogBuilder> builders = {
    DialogType.custom: (context, sheetRequest, completer) {
      return CustomDialog(
        request: sheetRequest,
        completer: completer,
      );
    },
    DialogType.infoAlert: (context, sheetRequest, completer) {
      return InfoAlertDialog(request: sheetRequest, completer: completer);
    },
  };

  dialogService.registerCustomDialogBuilders(builders);
}
