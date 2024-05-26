import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/media_extension.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
              radius: context.width * .24,
              backgroundColor: AppColors.primary,
              child: Image.asset("assets/images/logo.png")),
        ),
        SizedBox(
          height: context.height * .02,
        ),
        Text(
          "تسجيل دخول",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w800,
              fontSize: 20),
        ),
      ],
    );
  }
}
