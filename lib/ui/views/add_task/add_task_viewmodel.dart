import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/app/app.logger.dart';
import 'package:todos/services/tasks_service.dart';

import 'add_task_view.form.dart';

class AddTaskViewModel extends FormViewModel {
  final _log = getLogger('AddTaskViewModel');
  final _navigationService = locator<NavigationService>();
  final _tasksService = locator<TasksService>();

  @override
  void setFormStatus() {}

  bool get canSubmit =>
      !isBusy &&
      hasTitle &&
      !hasTitleValidationMessage &&
      (hasDescription ? !hasDescriptionValidationMessage : true);

  Future<void> accept() async {
    setBusy(true);

    try {
      _log.d('title:$titleValue description:$descriptionValue');

      _tasksService.add(title: titleValue!, description: descriptionValue);

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
