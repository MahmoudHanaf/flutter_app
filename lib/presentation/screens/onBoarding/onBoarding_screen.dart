import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/localization/app_localizations.dart';
import 'package:flutter_app/config/routes/app_routes.dart';
import 'package:flutter_app/core/network/cache_helper.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/app_strings.dart';
import 'package:flutter_app/core/utils/assets_manager.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import 'package:flutter_app/core/utils/sizedbox_extension.dart';
import 'package:flutter_app/presentation/screens/onBoarding/on_boarding_model.dart';
import 'package:flutter_app/presentation/widgets/default_button_widget.dart';

import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController onBoardingController;

  List<onBoardingModel> pageItems = [
    onBoardingModel(
        title: AppStrings.title1,
        body: AppStrings.body1,
        image: Assets.onBoarding1),
    onBoardingModel(
        title: AppStrings.title1,
        body: AppStrings.body1,
        image: Assets.onBoarding2),
    onBoardingModel(
        title: AppStrings.title1,
        body: AppStrings.body1,
        image: Assets.onBoarding3),
  ];

  @override
  void initState() {
    super.initState();
    onBoardingController = PageController(initialPage: 0)
      ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          skipButton(),
          Center(
            child: SizedBox(
              width: context.width,
              height: context.height * .8,
              child: PageView.builder(
                  controller: onBoardingController,
                  reverse: true,
                  itemCount: pageItems.length,
                  itemBuilder: (context, index) => onBoardingContent(index)),
            ),
          ),
          indicator(),
          Positioned(
            bottom: context.height * .05,
            left: context.width * .1,
            right: context.width * .1,
            child: DefaultButton(
              width: context.width * .8,
              onPressed: () {
                if (onBoardingController.page != null &&
                    onBoardingController.page! < 2) {
                  onBoardingController.nextPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut);
                } else {
                  onBoardingController.animateTo(0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut);
                  Navigator.pushNamed(context, Routes.login);
                  CacheHelper.saveData(key: "onBoarding", value: "true");
                  print(
                      "on boarding =======> ${CacheHelper.getData(key: "onBoarding")}");
                }
              },
              color: AppColors.primary,
              text: onBoardingController.hasClients
                  ? onBoardingController.page?.toInt() == 2
                      ? "ابدأ"
                      : "التالى"
                  : 'التالى',
              textColor: AppColors.white,
            ),
          )
        ],
      ),
    );
  }

  skipButton() {
    return Positioned(
        top: context.height * .08,
        left: context.width * .08,
        right: context.width * .08,
        child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: () {
              Navigator.pushNamed(context, Routes.login);
              CacheHelper.saveData(key: "onBoarding", value: "true");
            },
            child: Text(
              "تخطى",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
            )));
  }

  onBoardingContent(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          pageItems[index].image ?? '',
          fit: BoxFit.fill,
          width: context.width * .6,
          height: context.height * .3,
        ),
        20.ph,
        Text(
          pageItems[index].title ?? '',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
        ),
        10.ph,
        Container(
          width: context.width * .9,
          alignment: Alignment.center,
          child: Text(
            pageItems[index].body ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(),
          ),
        ),
      ],
    );
  }

  indicator() {
    return Positioned(
      bottom: context.height * .15,
      left: 0,
      right: 0,
      child: Center(
        child: DotsIndicator(
          dotsCount: 3,
          position: onBoardingController.hasClients
              ? onBoardingController.page?.toInt() ?? 0
              : 0,
          reversed: true,
          decorator: DotsDecorator(
            color: AppColors.grey,
            activeColor: AppColors.primary,
            size: const Size.square(10.0),
            activeSize: const Size(19.0, 10.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
