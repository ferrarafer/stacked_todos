import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todos/enums/action_type.dart';
import 'package:todos/ui/views/home/home_viewmodel.dart';

class ActionsButton extends ViewModelBuilderWidget<HomeViewModel> {
  const ActionsButton({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return PopupMenuButton<ActionType>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      tooltip: 'Todos Actions',
      onSelected: (action) => viewModel.executeAction(action),
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            child: Text('Clear completed'),
            value: ActionType.clearAllCompleted,
          ),
          PopupMenuItem(
            child: Text('Mark all as completed'),
            value: ActionType.markAllAsCompleted,
          ),
        ];
      },
      icon: const Icon(Icons.more_horiz),
    );
  }

  @override
  bool get reactive => false;

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
