import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/app/app.logger.dart';
import 'package:todos/app/app.router.dart';
import 'package:todos/enums/action_type.dart';
import 'package:todos/enums/dialog_type.dart';
import 'package:todos/enums/filter_type.dart';
import 'package:todos/enums/snackbar_type.dart';
import 'package:todos/models/task/task.dart';
import 'package:todos/services/tasks_service.dart';

class HomeViewModel extends ReactiveViewModel {
  final _log = getLogger('HomeViewModel');
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _tasksService = locator<TasksService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_tasksService];

  List<Task> get tasks => _tasksService.tasks;
  FilterType get currentFilterType => _tasksService.currentFilterType;

  void setCurrentFilterType(FilterType filterType) {
    _log.i('filterType:$filterType');
    _tasksService.setCurrentFilterType(filterType);
  }

  Future<void> executeAction(ActionType actionType) async {
    _log.i('actionType:$actionType');
    switch (actionType) {
      case ActionType.clearAllCompleted:
        await clearAllCompletedTasks();
        break;
      case ActionType.markAllAsCompleted:
        markAllTasksAsCompleted();
        break;
    }
  }

  Future<void> clearAllCompletedTasks() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.custom,
      title: 'Are you sure?',
      description: 'You are going to delete all completed tasks.',
      mainButtonTitle: 'Yes',
      secondaryButtonTitle: 'No',
    );

    _log.d('confirm:${response?.confirmed}');

    if (!(response?.confirmed ?? true)) return;

    _tasksService.clearAllCompletedTasks();
  }

  void markAllTasksAsCompleted() {
    _tasksService.markAllTasksAsCompleted();
  }

  void toggle(String id) {
    _log.i('id:$id');
    _tasksService.toggle(id);
  }

  void remove(String id) {
    _log.i('id:$id');

    final removedIndex = _tasksService.tasks.indexWhere((t) => t.id == id);
    if (removedIndex == -1) return;

    final removedTask = _tasksService.remove(id);

    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.custom,
      title: 'Task Deleted',
      message: 'Task [${removedTask!.title}] was deleted.',
      duration: const Duration(seconds: 5),
      mainButtonTitle: 'Undo',
      onMainButtonTapped: () {
        _tasksService.undoTaskRemoved(task: removedTask, index: removedIndex);
        _snackbarService.closeSnackbar();
      },
    );
  }

  Future<bool> confirmDismiss(Task task) async {
    _log.i('task:$task');
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.custom,
      title: 'Are you sure?',
      description: '''
        You are going to delete the following task:

        ${task.title}
      ''',
      mainButtonTitle: 'Yes',
      secondaryButtonTitle: 'No',
    );

    _log.d('confirm:${response?.confirmed}');

    if (!(response?.confirmed ?? true)) return false;

    return true;
  }

  void goToAddTaskView() {
    _navigationService.navigateToAddTaskView();
  }

  void goToEditTaskView(Task task) {
    _navigationService.navigateToEditTaskView(task: task);
  }
}
