// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:todos/models/task/task.dart' as _i7;
import 'package:todos/ui/views/add_task/add_task_view.dart' as _i4;
import 'package:todos/ui/views/edit_task/edit_task_view.dart' as _i5;
import 'package:todos/ui/views/home/home_view.dart' as _i3;
import 'package:todos/ui/views/startup/startup_view.dart' as _i2;

class Routes {
  static const startupView = '/startup-view';

  static const homeView = '/home-view';

  static const addTaskView = '/add-task-view';

  static const editTaskView = '/edit-task-view';

  static const all = <String>{
    startupView,
    homeView,
    addTaskView,
    editTaskView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.addTaskView,
      page: _i4.AddTaskView,
    ),
    _i1.RouteDef(
      Routes.editTaskView,
      page: _i5.EditTaskView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomeView(),
        settings: data,
      );
    },
    _i4.AddTaskView: (data) {
      final args = data.getArgs<AddTaskViewArguments>(
        orElse: () => const AddTaskViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.AddTaskView(key: args.key),
        settings: data,
      );
    },
    _i5.EditTaskView: (data) {
      final args = data.getArgs<EditTaskViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.EditTaskView(key: args.key, task: args.task),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddTaskViewArguments {
  const AddTaskViewArguments({this.key});

  final _i6.Key? key;
}

class EditTaskViewArguments {
  const EditTaskViewArguments({
    this.key,
    required this.task,
  });

  final _i6.Key? key;

  final _i7.Task task;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddTaskView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addTaskView,
        arguments: AddTaskViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditTaskView({
    _i6.Key? key,
    required _i7.Task task,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editTaskView,
        arguments: EditTaskViewArguments(key: key, task: task),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
