import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app/core/utils/media_extension.dart';

import '../../config/localization/app_localizations.dart';
import 'app_colors.dart';
import 'app_strings.dart';
import 'assets_manager.dart';

Widget searchWidget(BuildContext context, {Color color = Colors.blue}) =>
    InkWell(
      onTap: () {
        //TODO : Navigate to Search Screen
      },
      child: Container(
        margin: EdgeInsetsDirectional.all(context.width * .05),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.width * .05,
          // vertical: context.width * .03
        ),
        height: context.height * .06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color == Colors.blue
              ? AppColors.primary.withOpacity(0.12)
              : color,
          borderRadius: BorderRadius.circular(context.width * .02),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!
                  .translate(AppStrings.searchForSubject)!,
              style: TextStyle(color: AppColors.grey),
            ),
            //  SvgPicture.asset(Assets.assetsIconsSearch , color: AppColors.grey),
          ],
        ),
      ),
    );
