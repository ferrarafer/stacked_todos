import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todos/enums/filter_type.dart';
import 'package:todos/ui/views/home/home_viewmodel.dart';

class FilterButton extends ViewModelBuilderWidget<HomeViewModel> {
  const FilterButton({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return PopupMenuButton<FilterType>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      initialValue: viewModel.currentFilterType,
      tooltip: 'Filter',
      onSelected: (filterType) => viewModel.setCurrentFilterType(filterType),
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            child: Text('All'),
            value: FilterType.all,
          ),
          PopupMenuItem(
            child: Text('Active'),
            value: FilterType.active,
          ),
          PopupMenuItem(
            child: Text('Completed'),
            value: FilterType.completed,
          ),
        ];
      },
      icon: const Icon(Icons.filter_list_rounded),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
