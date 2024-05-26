import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import '../utils/app_colors.dart';
import '../utils/hex_color.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
   MyButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
        height: context.height / (context.height / 55),
        width: context.width / ( context.width / 275),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}