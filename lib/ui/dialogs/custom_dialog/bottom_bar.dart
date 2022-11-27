import 'package:flutter/material.dart';
import 'package:todos/ui/common/app_colors.dart';

class BottomBar extends StatelessWidget {
  final String buttonTitle;
  final String? cancelTitle;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;
  const BottomBar({
    Key? key,
    required this.buttonTitle,
    this.cancelTitle,
    this.onCancel,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isConfirmationDialog = cancelTitle != null;

    return Column(
      children: <Widget>[
        const Divider(color: kcVeryLightGrey, height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            if (isConfirmationDialog) ...[
              Expanded(
                child: TextButton(
                  child: Text(
                    cancelTitle!,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: onCancel,
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(color: kcVeryLightGrey),
              ),
            ],
            Expanded(
              child: TextButton(
                child: Text(
                  buttonTitle,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
