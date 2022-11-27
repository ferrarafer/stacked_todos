import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/app/app.router.dart';
import 'package:todos/enums/action_type.dart';
import 'package:todos/enums/dialog_type.dart';
import 'package:todos/enums/filter_type.dart';
import 'package:todos/enums/snackbar_type.dart';
import 'package:todos/models/task/task.dart';
import 'package:todos/ui/views/home/home_viewmodel.dart';

import '../../test/helpers/test_helpers.dart';

void main() {
  List<Task> _testTasks = [
    Task(id: '001', title: 'Task 001', description: 'Description 001'),
    Task(id: '002', title: 'Task 002'),
    Task(
      id: '003',
      title: 'Task 003',
      description: 'Description 003',
      isCompleted: true,
    ),
    Task(id: '004', title: 'Task 004', description: 'Description 004'),
  ];

  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('tasks -', () {
      test('When called, should returns tasks from TasksService', () {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        expect(model.tasks, tasksService.tasks);
      });
    });

    group('currentFilterType -', () {
      test('When called, should returns current FilterType from TasksService',
          () {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        expect(model.currentFilterType, tasksService.currentFilterType);
      });
    });

    group('setCurrentFilterType -', () {
      test('When called, should call setCurrentFilterType on TasksService', () {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        model.setCurrentFilterType(FilterType.completed);

        verify(tasksService.setCurrentFilterType(FilterType.completed));
      });
    });

    group('executeAction -', () {
      test(
          'When called with ActionType.clearAllCompleted, should call clearAllCompletedTasks',
          () async {
        final dialogService = getAndRegisterDialogService(
          dialogResponse: DialogResponse(confirmed: true),
        );
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        await model.executeAction(ActionType.clearAllCompleted);

        verifyInOrder([
          dialogService.showCustomDialog(
            variant: DialogType.custom,
            title: anyNamed('title'),
            description: anyNamed('description'),
            mainButtonTitle: anyNamed('mainButtonTitle'),
            secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
          ),
          tasksService.clearAllCompletedTasks(),
        ]);
      });

      test(
          'When called with ActionType.markAllAsCompleted, should call markAllTasksAsCompleted',
          () async {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        await model.executeAction(ActionType.markAllAsCompleted);

        verify(tasksService.markAllTasksAsCompleted());
      });
    });

    group('clearAllCompletedTasks -', () {
      test(
          'When called, should call clearAllCompletedTasks on TasksService if dialog confirmed',
          () async {
        final dialogService = getAndRegisterDialogService(
          dialogResponse: DialogResponse(confirmed: true),
        );
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        await model.clearAllCompletedTasks();

        verifyInOrder([
          dialogService.showCustomDialog(
            variant: DialogType.custom,
            title: anyNamed('title'),
            description: anyNamed('description'),
            mainButtonTitle: anyNamed('mainButtonTitle'),
            secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
          ),
          tasksService.clearAllCompletedTasks(),
        ]);
      });

      test(
          'When called, should NOT call clearAllCompletedTasks on TasksService if dialog NOT confirmed',
          () async {
        final dialogService = getAndRegisterDialogService(
          dialogResponse: DialogResponse(confirmed: false),
        );
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        await model.clearAllCompletedTasks();

        verify(dialogService.showCustomDialog(
          variant: DialogType.custom,
          title: anyNamed('title'),
          description: anyNamed('description'),
          mainButtonTitle: anyNamed('mainButtonTitle'),
          secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
        ));
        verifyNever(tasksService.clearAllCompletedTasks());
      });
    });

    group('markAllTasksAsCompleted -', () {
      test('When called, should call markAllTasksAsCompleted on TasksService',
          () {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        model.markAllTasksAsCompleted();

        verify(tasksService.markAllTasksAsCompleted());
      });
    });

    group('toggle -', () {
      test('When called, should call toggle on TasksService', () {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        model.toggle('001');

        verify(tasksService.toggle('001'));
      });
    });

    group('remove -', () {
      test('When called, should call remove on TasksService', () {
        final tasksService = getAndRegisterTasksService(
          tasks: _testTasks,
          task: _testTasks[0],
        );
        final model = _getModel();

        model.remove('001');

        verify(tasksService.remove('001'));
      });

      test('When called, should call showCustomSnackBar on SnackbarService',
          () {
        getAndRegisterTasksService(
          tasks: _testTasks,
          task: _testTasks[0],
        );
        final snackbarService = getAndRegisterSnackbarService();
        final model = _getModel();

        model.remove('001');

        verify(snackbarService.showCustomSnackBar(
          variant: SnackbarType.custom,
          title: anyNamed('title'),
          message: anyNamed('message'),
          duration: anyNamed('duration'),
          mainButtonTitle: anyNamed('mainButtonTitle'),
          onMainButtonTapped: anyNamed('onMainButtonTapped'),
        ));
      });

      test('When called and task does NOT exist, should NOT do anything', () {
        final tasksService = getAndRegisterTasksService(
          tasks: _testTasks,
          task: _testTasks[0],
        );
        final snackbarService = getAndRegisterSnackbarService();
        final model = _getModel();

        model.remove('666');

        verifyNever(tasksService.remove('666'));
        verifyNever(snackbarService.showCustomSnackBar(
          variant: SnackbarType.custom,
          title: anyNamed('title'),
          message: anyNamed('message'),
          duration: anyNamed('duration'),
          mainButtonTitle: anyNamed('mainButtonTitle'),
          onMainButtonTapped: anyNamed('onMainButtonTapped'),
        ));
      });
    });

    group('confirmDismiss -', () {
      test('When called, should call showCustomDialog on DialogService',
          () async {
        getAndRegisterTasksService(tasks: _testTasks, task: _testTasks[0]);
        final dialogService = getAndRegisterDialogService();
        final model = _getModel();

        model.confirmDismiss(_testTasks[0]);

        verify(dialogService.showCustomDialog(
          variant: DialogType.custom,
          title: anyNamed('title'),
          description: anyNamed('description'),
          mainButtonTitle: anyNamed('mainButtonTitle'),
          secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
        ));
      });

      test('When called and confirmed, should returns TRUE', () async {
        getAndRegisterTasksService(tasks: _testTasks, task: _testTasks[0]);
        getAndRegisterDialogService(
          dialogResponse: DialogResponse(confirmed: true),
        );
        final model = _getModel();

        final isConfirmed = await model.confirmDismiss(_testTasks[0]);

        expect(isConfirmed, isTrue);
      });

      test('When called and NOT confirmed, should returns FALSE', () async {
        getAndRegisterTasksService(tasks: _testTasks, task: _testTasks[0]);
        getAndRegisterDialogService(
          dialogResponse: DialogResponse(confirmed: false),
        );
        final model = _getModel();

        final isConfirmed = await model.confirmDismiss(_testTasks[0]);

        expect(isConfirmed, isFalse);
      });
    });

    group('goToAddTaskView -', () {
      test('When called, should navigates to AddTaskView', () {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();

        model.goToAddTaskView();

        verify(navigationService.navigateTo(
          Routes.addTaskView,
          arguments: anyNamed('arguments'),
        ));
      });
    });

    group('goToEditTaskView -', () {
      test('When called, should navigates to EditTaskView', () {
        getAndRegisterTasksService(tasks: _testTasks);
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();

        model.goToEditTaskView(_testTasks[0]);

        verify(navigationService.navigateTo(
          Routes.editTaskView,
          arguments: anyNamed('arguments'),
        ));
      });
    });
  });
}
