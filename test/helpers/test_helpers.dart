import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todos/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/models/task/task.dart';
import 'package:todos/services/tasks_service.dart';
import 'package:todos/services/shared_preferences_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SnackbarService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TasksService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SharedPreferencesService>(
      onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterSnackbarService();
  getAndRegisterTasksService();
  getAndRegisterSharedPreferencesService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService({
  DialogResponse? dialogResponse,
}) {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);

  when(service.showCustomDialog(
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    barrierColor: anyNamed('barrierColor'),
    barrierDismissible: anyNamed('barrierDismissible'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    takesInput: anyNamed('takesInput'),
    title: anyNamed('title'),
    variant: anyNamed('variant'),
  )).thenAnswer((realInvocation) => Future.value(dialogResponse));

  return service;
}

MockSnackbarService getAndRegisterSnackbarService() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

MockTasksService getAndRegisterTasksService({
  List<Task> tasks = const [],
  Task? task,
}) {
  _removeRegistrationIfExists<TasksService>();
  final service = MockTasksService();
  locator.registerSingleton<TasksService>(service);

  when(service.tasks).thenReturn(tasks);

  when(service.remove(any)).thenReturn(task);

  return service;
}

MockSharedPreferencesService getAndRegisterSharedPreferencesService({
  List<Task> tasks = const [],
}) {
  _removeRegistrationIfExists<SharedPreferencesService>();
  final service = MockSharedPreferencesService();
  locator.registerSingleton<SharedPreferencesService>(service);

  when(service.tasks).thenReturn(tasks);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
