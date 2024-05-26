import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double height;
  final bool withBorder;
  final bool isIcon;
  final bool isText;
  final String svgPath;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  const DefaultButton(
      {super.key,
      required this.onPressed,
      this.text = '',
      required this.width,
      this.withBorder = false,
      this.isIcon = false,
      this.svgPath = '',
      this.color,
      this.isText = true,
      this.height = 42,
      this.textColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          overlayColor:
              MaterialStatePropertyAll(AppColors.white.withOpacity(.3)),
          backgroundColor: MaterialStatePropertyAll(
              color != null ? color : AppColors.primary),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textColor != null
              ? Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: textColor,
                  )
              : Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: withBorder ? AppColors.white : null),
        ),
      ),
    );

    // ElevatedButton(
    //   onPressed: onPressed,
    //   style: ButtonStyle(
    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     padding: const MaterialStatePropertyAll(EdgeInsets.zero),
    //     minimumSize: MaterialStateProperty.all(
    //       Size(context.width * .8, height),
    //     ),
    //     overlayColor: MaterialStatePropertyAll(
    //         withBorder ? AppColors.primary : AppColors.white.withOpacity(.3)),
    //     backgroundColor:
    //         MaterialStateProperty.all(withBorder ? Colors.transparent : color),
    //     shadowColor: MaterialStateProperty.all(Colors.transparent),
    //     side: withBorder
    //         ? MaterialStatePropertyAll(BorderSide(color: AppColors.primary))
    //         : null,
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       if (isIcon)
    //         SvgPicture.asset(
    //           svgPath,
    //           height: 22,
    //           width: 22,
    //           fit: BoxFit.fill,
    //           color: iconColor,
    //         ),
    //       if (isIcon && isText)
    //         SizedBox(
    //           width: 20,
    //         ),
    //       if (isText)
    //         Text(
    //           text,
    //           style: textColor != null
    //               ? Theme.of(context)
    //                   .textTheme
    //                   .titleMedium
    //                   ?.copyWith(color: textColor)
    //               : Theme.of(context)
    //                   .textTheme
    //                   .titleMedium
    //                   ?.copyWith(color: withBorder ? AppColors.primary : null),
    //         ),
    //     ],
    //   ),
    // );
  }
}
