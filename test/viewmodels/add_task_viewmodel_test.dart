import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/ui/views/add_task/add_task_view.form.dart';
import 'package:todos/ui/views/add_task/add_task_viewmodel.dart';

import '../../test/helpers/test_helpers.dart';

void main() {
  AddTaskViewModel _getModel() => AddTaskViewModel();

  group('AddTaskViewModel Tests -', () {
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

    group('accept -', () {
      test('When called, should adds task to tasks list', () async {
        final tasksService = getAndRegisterTasksService();
        final model = _getModel();

        model.formValueMap['title'] = 'title';
        model.formValueMap['description'] = 'description';
        await model.accept();

        verify(tasksService.add(
          title: anyNamed('title'),
          description: anyNamed('description'),
        ));
      });

      test('When called, should navigates back to HomeView', () async {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();

        model.formValueMap['title'] = 'title';
        model.formValueMap['description'] = 'description';
        await model.accept();

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
