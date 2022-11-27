import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos/app/app.logger.dart';
import 'package:todos/models/task/task.dart';

/// Provides a local storage which allows you to save key/value pairs
class SharedPreferencesService {
  static const String _tasksKey = "tasks";

  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;
  static Future<SharedPreferencesService> getInstance({
    bool enableLogs = false,
  }) async {
    _instance ??= SharedPreferencesService(enableLogs: enableLogs);
    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  final _log = getLogger('SharedPreferencesService');

  final bool? enableLogs;
  SharedPreferencesService({this.enableLogs});

  void dispose() {
    _log.i('');
    _preferences?.clear();
  }

  set _encodedTasks(List<String> tasks) => _saveToDisk(_tasksKey, tasks);

  List<String> get _encodedTasks {
    List<String> tasks = List<String>.from(_getFromDisk(_tasksKey) ?? []);
    return tasks;
  }

  set tasks(List<Task> tasks) {
    _encodedTasks = tasks.map((t) => json.encode(t.toJson())).toList();
  }

  List<Task> get tasks {
    return _encodedTasks.map((t) => Task.fromJson(json.decode(t))).toList();
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences?.get(key);
    if (enableLogs!) _log.v('key:$key value:$value');
    return value;
  }

  void _saveToDisk(String key, dynamic value) {
    if (enableLogs!) _log.v('key:$key value:$value');

    switch (value.runtimeType) {
      case String:
        _preferences?.setString(key, value);
        break;
      case bool:
        _preferences?.setBool(key, value);
        break;
      case int:
        _preferences?.setInt(key, value);
        break;
      case double:
        _preferences?.setDouble(key, value);
        break;
      case List<String>:
        _preferences?.setStringList(key, value);
        break;
    }
  }
}
