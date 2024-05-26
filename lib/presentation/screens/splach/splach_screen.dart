import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes/app_routes.dart';
import 'package:flutter_app/core/network/cache_helper.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import 'package:flutter_app/core/utils/sizedbox_extension.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (CacheHelper.getData(key: "registered") == "true") {
        return Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
      } else {
        if (CacheHelper.getData(key: "onBoarding") == "true") {
          return Navigator.pushNamedAndRemoveUntil(
              context, Routes.login, (route) => false);
        } else {
          return Navigator.pushNamedAndRemoveUntil(
              context, Routes.onBoarding, (route) => false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: context.width * 1,
        height: context.height * 1,
        color: AppColors.primary,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            .2.ph,
            Text(
              "Teaching Center ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.secondColor, fontWeight: FontWeight.w500),
            ),
          ],
        )),
      ),
    );
  }
}
