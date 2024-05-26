import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/loading.json',
      width: context.width * .2,
      height: context.height * .1,
      fit: BoxFit.fill,
    );
  }
}
