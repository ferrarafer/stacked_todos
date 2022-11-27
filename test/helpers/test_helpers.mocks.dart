// Mocks generated by Mockito 5.3.2 from annotations
// in todos/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:flutter/material.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i2;
import 'package:todos/enums/filter_type.dart' as _i7;
import 'package:todos/models/task/task.dart' as _i8;
import 'package:todos/services/shared_preferences_service.dart' as _i9;
import 'package:todos/services/tasks_service.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i2.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i3.GlobalKey<_i3.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i3.GlobalKey<_i3.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i2.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<T?>? navigateWithTransition<T>(
    _i3.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i3.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i2.Transition? transitionClass,
    _i2.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? replaceWithTransition<T>(
    _i3.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i3.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i2.Transition? transitionClass,
    _i2.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i3.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i3.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? navigateToView<T>(
    _i3.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i3.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i2.Transition? transition,
    _i2.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i3.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearStackAndShowView<T>(
    _i3.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearTillFirstAndShowView<T>(
    _i3.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i3.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i2.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i2.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i4.Future<_i2.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i2.SheetResponse<dynamic>?>.value(),
      ) as _i4.Future<_i2.SheetResponse<dynamic>?>);
  @override
  _i4.Future<_i2.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i5.Color? barrierColor = const _i5.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i4.Future<_i2.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i4.Future<_i2.SheetResponse<T>?>.value(),
      ) as _i4.Future<_i2.SheetResponse<T>?>);
  @override
  void completeSheet(_i2.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i2.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i2.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i3.Widget Function(
      _i3.BuildContext,
      _i2.DialogRequest<dynamic>,
      dynamic Function(_i2.DialogResponse<dynamic>),
    )?
        builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i5.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i5.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i2.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i4.Future<_i2.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i2.DialogResponse<dynamic>?>.value(),
      ) as _i4.Future<_i2.DialogResponse<dynamic>?>);
  @override
  _i4.Future<_i2.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i5.Color? barrierColor = const _i5.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i4.Future<_i2.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i4.Future<_i2.DialogResponse<T>?>.value(),
      ) as _i4.Future<_i2.DialogResponse<T>?>);
  @override
  _i4.Future<_i2.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    String? confirmationTitle = r'Ok',
    bool? barrierDismissible = false,
    _i2.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #confirmationTitle: confirmationTitle,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i4.Future<_i2.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i2.DialogResponse<dynamic>?>.value(),
      ) as _i4.Future<_i2.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i2.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SnackbarService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackbarService extends _i1.Mock implements _i2.SnackbarService {
  @override
  bool get isSnackbarOpen => (super.noSuchMethod(
        Invocation.getter(#isSnackbarOpen),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void registerSnackbarConfig(_i2.SnackbarConfig? config) => super.noSuchMethod(
        Invocation.method(
          #registerSnackbarConfig,
          [config],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomMainButtonBuilder({
    dynamic variant,
    _i3.Widget Function(
      String?,
      Function?,
    )?
        builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomMainButtonBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomSnackbarConfig({
    required dynamic variant,
    _i2.SnackbarConfig? config,
    _i2.SnackbarConfig Function()? configBuilder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomSnackbarConfig,
          [],
          {
            #variant: variant,
            #config: config,
            #configBuilder: configBuilder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void showSnackbar({
    String? title = r'',
    required String? message,
    dynamic Function(dynamic)? onTap,
    Duration? duration = const Duration(seconds: 3),
    String? mainButtonTitle,
    void Function()? onMainButtonTapped,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showSnackbar,
          [],
          {
            #title: title,
            #message: message,
            #onTap: onTap,
            #duration: duration,
            #mainButtonTitle: mainButtonTitle,
            #onMainButtonTapped: onMainButtonTapped,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<dynamic>? showCustomSnackBar({
    required String? message,
    _i3.TextStyle? messageTextStyle,
    required dynamic variant,
    String? title,
    _i3.TextStyle? titleTextStyle,
    String? mainButtonTitle,
    _i3.ButtonStyle? mainButtonStyle,
    void Function()? onMainButtonTapped,
    Function? onTap,
    Duration? duration = const Duration(seconds: 1),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSnackBar,
          [],
          {
            #message: message,
            #messageTextStyle: messageTextStyle,
            #variant: variant,
            #title: title,
            #titleTextStyle: titleTextStyle,
            #mainButtonTitle: mainButtonTitle,
            #mainButtonStyle: mainButtonStyle,
            #onMainButtonTapped: onMainButtonTapped,
            #onTap: onTap,
            #duration: duration,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<dynamic>?);
  @override
  _i4.Future<void> closeSnackbar() => (super.noSuchMethod(
        Invocation.method(
          #closeSnackbar,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [TasksService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTasksService extends _i1.Mock implements _i6.TasksService {
  @override
  _i7.FilterType get currentFilterType => (super.noSuchMethod(
        Invocation.getter(#currentFilterType),
        returnValue: _i7.FilterType.all,
        returnValueForMissingStub: _i7.FilterType.all,
      ) as _i7.FilterType);
  @override
  List<_i8.Task> get tasks => (super.noSuchMethod(
        Invocation.getter(#tasks),
        returnValue: <_i8.Task>[],
        returnValueForMissingStub: <_i8.Task>[],
      ) as List<_i8.Task>);
  @override
  List<_i8.Task> get allTasks => (super.noSuchMethod(
        Invocation.getter(#allTasks),
        returnValue: <_i8.Task>[],
        returnValueForMissingStub: <_i8.Task>[],
      ) as List<_i8.Task>);
  @override
  List<_i8.Task> get activeTasks => (super.noSuchMethod(
        Invocation.getter(#activeTasks),
        returnValue: <_i8.Task>[],
        returnValueForMissingStub: <_i8.Task>[],
      ) as List<_i8.Task>);
  @override
  List<_i8.Task> get completedTasks => (super.noSuchMethod(
        Invocation.getter(#completedTasks),
        returnValue: <_i8.Task>[],
        returnValueForMissingStub: <_i8.Task>[],
      ) as List<_i8.Task>);
  @override
  bool get hasTasks => (super.noSuchMethod(
        Invocation.getter(#hasTasks),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get hasActiveTasks => (super.noSuchMethod(
        Invocation.getter(#hasActiveTasks),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get hasCompletedTasks => (super.noSuchMethod(
        Invocation.getter(#hasCompletedTasks),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void setCurrentFilterType(_i7.FilterType? filterType) => super.noSuchMethod(
        Invocation.method(
          #setCurrentFilterType,
          [filterType],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void add({
    String? id,
    required String? title,
    String? description,
    bool? isCompleted,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #add,
          [],
          {
            #id: id,
            #title: title,
            #description: description,
            #isCompleted: isCompleted,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void update({
    required String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [],
          {
            #id: id,
            #title: title,
            #description: description,
            #isCompleted: isCompleted,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Task? remove(String? id) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [id],
        ),
        returnValueForMissingStub: null,
      ) as _i8.Task?);
  @override
  void undoTaskRemoved({
    required _i8.Task? task,
    required int? index,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #undoTaskRemoved,
          [],
          {
            #task: task,
            #index: index,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toggle(String? id) => super.noSuchMethod(
        Invocation.method(
          #toggle,
          [id],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clearAllCompletedTasks() => super.noSuchMethod(
        Invocation.method(
          #clearAllCompletedTasks,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void markAllTasksAsCompleted() => super.noSuchMethod(
        Invocation.method(
          #markAllTasksAsCompleted,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SharedPreferencesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesService extends _i1.Mock
    implements _i9.SharedPreferencesService {
  @override
  set tasks(List<_i8.Task>? tasks) => super.noSuchMethod(
        Invocation.setter(
          #tasks,
          tasks,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i8.Task> get tasks => (super.noSuchMethod(
        Invocation.getter(#tasks),
        returnValue: <_i8.Task>[],
        returnValueForMissingStub: <_i8.Task>[],
      ) as List<_i8.Task>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
