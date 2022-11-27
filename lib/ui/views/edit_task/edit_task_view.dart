import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todos/helpers/form_validators.dart';
import 'package:todos/models/task/task.dart';
import 'package:todos/ui/common/ui_helpers.dart';

import 'edit_task_view.form.dart';
import 'edit_task_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'title', validator: FormValidators.title),
    FormTextField(name: 'description', validator: FormValidators.description),
  ],
)
class EditTaskView extends ViewModelBuilderWidget<EditTaskViewModel>
    with $EditTaskView {
  final Task task;
  EditTaskView({Key? key, required this.task}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditTaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter TodosMVVM')),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              const Text('Title'),
              verticalSpaceSmall,
              TextFormField(
                controller: titleController,
                focusNode: titleFocusNode,
                textAlignVertical: TextAlignVertical.top,
              ),
              if (viewModel.hasTitleValidationMessage)
                Text(viewModel.titleValidationMessage!),
              verticalSpaceMedium,
              const Text('Description'),
              verticalSpaceSmall,
              TextFormField(
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                textAlignVertical: TextAlignVertical.top,
              ),
              if (viewModel.hasDescriptionValidationMessage)
                Text(viewModel.descriptionValidationMessage!),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  MaterialButton(
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    color: viewModel.canSubmit
                        ? Colors.white
                        : Colors.grey.shade700,
                    onPressed: () {
                      if (!viewModel.canSubmit) return;

                      viewModel.update(task.id);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    textColor:
                        viewModel.canSubmit ? Colors.black : Colors.black45,
                  ),
                  MaterialButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    color: Colors.white,
                    onPressed: viewModel.cancel,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    textColor: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(EditTaskViewModel viewModel) {
    listenToFormUpdated(viewModel);
    titleController.text = task.title;
    if (task.description != null) {
      descriptionController.text = task.description!;
    }
  }

  @override
  void onDispose(EditTaskViewModel viewModel) {
    disposeForm();
  }

  @override
  EditTaskViewModel viewModelBuilder(BuildContext context) {
    return EditTaskViewModel();
  }
}
