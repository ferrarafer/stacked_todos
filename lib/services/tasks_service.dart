import 'package:stacked/stacked.dart';
import 'package:todos/app/app.locator.dart';
import 'package:todos/app/app.logger.dart';
import 'package:todos/enums/filter_type.dart';
import 'package:todos/models/task/task.dart';
import 'package:todos/services/shared_preferences_service.dart';
import 'package:uuid/uuid.dart';

/// Provides all the business logic to manipulate the tasks of the app
class TasksService with ReactiveServiceMixin {
  TasksService() {
    _tasks.addAll(_sharedPrefService.tasks);
  }

  final _log = getLogger('TasksService');
  final _sharedPrefService = locator<SharedPreferencesService>();

  final List<Task> _tasks = <Task>[];
  FilterType _currentFilterType = FilterType.all;

  FilterType get currentFilterType => _currentFilterType;

  List<Task> get tasks {
    switch (_currentFilterType) {
      case FilterType.all:
        return allTasks;
      case FilterType.active:
        return activeTasks;
      case FilterType.completed:
        return completedTasks;
    }
  }

  List<Task> get allTasks => _tasks;
  List<Task> get activeTasks => _tasks
      .where(
        (task) => !task.isCompleted,
      )
      .toList();
  List<Task> get completedTasks => _tasks
      .where(
        (task) => task.isCompleted,
      )
      .toList();

  bool get hasTasks => allTasks.isNotEmpty;
  bool get hasActiveTasks => activeTasks.isNotEmpty;
  bool get hasCompletedTasks => completedTasks.isNotEmpty;

  void setCurrentFilterType(FilterType filterType) {
    _log.i('filterType:$filterType');
    _currentFilterType = filterType;
    notifyListeners();
  }

  /// Adds a Task into [_tasks] list
  void add({
    String? id,
    required String title,
    String? description,
    bool? isCompleted,
  }) {
    _log.i(
      'id:$id title:$title description:$description isCompleted:$isCompleted',
    );
    _tasks.add(Task(
      id: id ?? const Uuid().v4(),
      title: title,
      description: description,
      isCompleted: isCompleted ?? false,
    ));
    _sharedPrefService.tasks = _tasks;
    notifyListeners();
  }

  /// Updates a Task inside [_tasks] list
  void update({
    required String id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    _log.i(
      'id:$id title:$title description:$description isComplete:$isCompleted',
    );
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index == -1) return;

    _tasks[index] = _tasks[index].copyWith(
      title: title ?? _tasks[index].title,
      description: description ?? _tasks[index].description,
      isCompleted: isCompleted ?? _tasks[index].isCompleted,
    );
    _sharedPrefService.tasks = _tasks;
    notifyListeners();
  }

  /// Removes a Task from the [_tasks] list
  Task? remove(String id) {
    _log.i('id:$id');

    final index = _tasks.indexWhere((task) => task.id == id);
    if (index == -1) return null;

    final removedTask = _tasks[index];
    _tasks.removeAt(index);
    _sharedPrefService.tasks = _tasks;
    notifyListeners();

    return removedTask;
  }

  /// Inserts removed task again into tasks list at index position
  void undoTaskRemoved({required Task task, required int index}) {
    _log.i('task:$task index:$index');
    _tasks.insert(index, task);
    _sharedPrefService.tasks = _tasks;
    notifyListeners();
  }

  /// Toggles [isCompleted] boolean value of Task object with id equal [id]
  void toggle(String id) {
    _log.i('id:$id');
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index == -1) return;

    _tasks[index] = _tasks[index].copyWith(
      isCompleted: !_tasks[index].isCompleted,
    );
    _sharedPrefService.tasks = _tasks;
    notifyListeners();
  }

  /// Removes all completed tasks from [_tasks] list
  void clearAllCompletedTasks() {
    _tasks.removeWhere((task) => task.isCompleted);
    _sharedPrefService.tasks = _tasks;
    notifyListeners();
  }

  /// Mark all tasks [_tasks] as completed
  void markAllTasksAsCompleted() {
    for (var i = 0; i < _tasks.length; i++) {
      if (_tasks[i].isCompleted) continue;

      _tasks[i] = _tasks[i].copyWith(isCompleted: true);
    }

    _sharedPrefService.tasks = _tasks;
    notifyListeners();
  }
}
