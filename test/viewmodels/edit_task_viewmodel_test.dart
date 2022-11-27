import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/models/task/task.dart';
import 'package:todos/ui/views/edit_task/edit_task_view.form.dart';
import 'package:todos/ui/views/edit_task/edit_task_viewmodel.dart';

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

  EditTaskViewModel _getModel() => EditTaskViewModel();

  group('EditTaskViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('canSubmit -', () {
      test('When called, should returns True', () {
        final model = _getModel();

        model.formValueMap['title'] = 'title';
        model.formValueMap['description'] = 'description';

        expect(model.canSubmit, isTrue);
      });

      test('When called and model isBusy, should returns False', () {
        final model = _getModel();

        model.setBusy(true);

        expect(model.canSubmit, isFalse);
      });

      test('When called and has NOT title, should returns False', () {
        final model = _getModel();

        model.setBusy(false);
        model.formValueMap['description'] = 'description';

        expect(model.canSubmit, isFalse);
      });

      test('When called and hasTitleValidationMessage, should returns False',
          () {
        final model = _getModel();

        model.setBusy(false);
        model.formValueMap['title'] = 'a';
        model.setValidationMessages({
          TitleValueKey: 'Please enter a title that\'s 3 characters or longer',
        });

        expect(model.canSubmit, isFalse);
      });

      test(
          'When called, hasDescription and hasDescriptionValidationMessage is False, should returns False',
          () {
        final model = _getModel();

        model.setBusy(false);
        model.formValueMap['title'] = 'abcd';
        model.formValueMap['description'] = 'abc';
        model.setValidationMessages({
          DescriptionValueKey:
              'Please enter a description that\'s 6 characters or longer',
        });

        expect(model.canSubmit, isFalse);
      });
    });

    group('update -', () {
      test('When called, should updates task on tasks list', () async {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        model.formValueMap['title'] = 'title';
        model.formValueMap['description'] = 'description';
        await model.update(_testTasks[0].id);

        verify(tasksService.update(
          id: anyNamed('id'),
          title: anyNamed('title'),
          description: anyNamed('description'),
        ));
      });

      test('When called, should navigates back to HomeView', () async {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();

        model.formValueMap['title'] = 'title';
        model.formValueMap['description'] = 'description';
        await model.update(_testTasks[0].id);

        verify(navigationService.back());
      });
    });

    group('cancel -', () {
      test('When called, should navigates back to HomeView', () {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();

        model.cancel();

        verify(navigationService.back());
      });
    });
  });
}
