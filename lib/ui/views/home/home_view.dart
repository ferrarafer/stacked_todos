import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todos/ui/views/home/widgets/filter_button.dart';
import 'package:todos/ui/views/home/widgets/actions_button.dart';

import 'home_viewmodel.dart';
import 'widgets/task_tile.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TodosMVVM'),
        actions: const [FilterButton(), ActionsButton()],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final task = viewModel.tasks[index];
          return TaskTile(
            task: task,
            confirmDismiss: (task) => viewModel.confirmDismiss(task),
            onDismissed: (id) => viewModel.remove(id),
            onTap: (task) => viewModel.goToEditTaskView(task),
            onToggle: (id) => viewModel.toggle(id),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1);
        },
        itemCount: viewModel.tasks.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.goToAddTaskView,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
