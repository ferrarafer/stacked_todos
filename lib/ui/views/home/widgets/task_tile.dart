import 'package:flutter/material.dart';
import 'package:todos/models/task/task.dart';

class TaskTile extends StatelessWidget {
  final Future<bool> Function(Task)? confirmDismiss;
  final void Function(String)? onDismissed;
  final void Function(Task)? onTap;
  final void Function(String)? onToggle;
  final Task task;
  const TaskTile({
    super.key,
    this.confirmDismiss,
    this.onDismissed,
    this.onTap,
    this.onToggle,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(task.id),
      direction: onDismissed != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0.0),
        onTap: () => onTap?.call(task),
        leading: IconButton(
          onPressed: () => onToggle?.call(task.id),
          icon: task.isCompleted
              ? const Icon(Icons.check_box_outlined)
              : const Icon(Icons.check_box_outline_blank),
        ),
        title: Text(
          task.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: task.description != null
            ? Text(
                task.description!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      ),
      onDismissed: (direction) => onDismissed?.call(task.id),
      confirmDismiss: (direction) async => confirmDismiss?.call(task),
      background: ColoredBox(
        color: theme.colorScheme.error,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
