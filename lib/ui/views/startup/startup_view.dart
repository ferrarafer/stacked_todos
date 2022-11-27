import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:todos/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends ViewModelBuilderWidget<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, StartupViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'TodoMVVM with STACKED',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            verticalSpaceMedium,
            const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 6,
              ),
            ),
            verticalSpaceMassive,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Powered by',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceTiny,
                    Image.asset('assets/images/filledstacks_logo.png'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => viewModel.runStartupLogic(),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) {
    return StartupViewModel();
  }
}
