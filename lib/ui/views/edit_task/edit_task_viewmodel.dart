import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/app/app.logger.dart';
import 'package:todos/services/tasks_service.dart';

import 'edit_task_view.form.dart';

class EditTaskViewModel extends FormViewModel {
  final _log = getLogger('EditTaskViewModel');
  final _navigationService = locator<NavigationService>();
  final _tasksService = locator<TasksService>();

  @override
  void setFormStatus() {}

  bool get canSubmit =>
      !isBusy &&
      hasTitle &&
      !hasTitleValidationMessage &&
      (hasDescription ? !hasDescriptionValidationMessage : true);

  Future<void> update(String id) async {
    setBusy(true);

    try {
      _log.d('id:$id title:$titleValue description:$descriptionValue');

      _tasksService.update(
        id: id,
        title: titleValue!,
        description: descriptionValue,
      );

      _navigationService.back();
    } catch (e) {
      _log.e(e.toString());
    }

    setBusy(false);
  }

  void cancel() {
    _navigationService.back();
  }
}
