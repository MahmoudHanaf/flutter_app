import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/media_extension.dart';

class MessageAlert extends StatelessWidget {
  final bool visible;
  final Color color;
  final String message;
  // final Color? textColor;

  const MessageAlert({
    super.key,
    required this.visible,
    required this.color,
    required this.message,
  });
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: EdgeInsets.all(context.width * .02),
        height: context.height * .1,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.width * 0.01),
            border: Border.all(color: color)),
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: color, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
