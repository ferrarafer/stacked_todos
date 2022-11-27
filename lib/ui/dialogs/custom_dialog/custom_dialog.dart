import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todos/ui/common/ui_helpers.dart';

import 'bottom_bar.dart';

class CustomDialog extends StatelessWidget {
  final Function(DialogResponse) completer;
  final DialogRequest request;

  const CustomDialog({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceMedium,
          if (request.title != null) ...[
            Text(
              request.title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
          ],
          if (request.description != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                request.description!,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpaceMedium,
          ],
          BottomBar(
            buttonTitle: request.mainButtonTitle ?? 'Close',
            cancelTitle: request.secondaryButtonTitle,
            onCancel: () => completer.call((DialogResponse(confirmed: false))),
            onConfirm: () => completer.call((DialogResponse(confirmed: true))),
          ),
        ],
      ),
    );
  }
}
