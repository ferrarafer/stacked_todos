import 'package:stacked/stacked_annotations.dart';
import 'package:todos/ui/views/home/home_view.dart';
import 'package:todos/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/services/tasks_service.dart';
import 'package:todos/services/shared_preferences_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: TasksService),
// @stacked-service

    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class App {}
