// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_app/core/utils/app_colors.dart';

// class DefaultTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   bool obscureText;
//   final Function validator;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final double? width;
//   final double? height;
//   final String hintText;
//   final double? padding;
//   final Function()? onTap;
//   final TextInputType type;
//   DefaultTextFormField(
//       {required this.controller,
//       this.obscureText = false,
//       this.onTap,
//       this.height,
//       this.padding,
//       this.type = TextInputType.text,
//       this.width,
//       required this.validator,
//       this.prefixIcon = const Icon(Icons.person),
//       this.suffixIcon,
//       this.hintText = '',
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       padding: EdgeInsets.symmetric(
//         horizontal: padding ?? 0,
//       ),
//       child: TextFormField(
//         maxLines: 1,
//         onTap: onTap,
//         controller: controller,
//         obscureText: obscureText,
//         cursorColor: AppColors.primary,
//         keyboardType: type,
//         enabled: true,
//         validator: (value) => validator(value),
//         decoration: InputDecoration(
//           fillColor: Colors.grey.shade200,
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIcon,
//           hintText: hintText,
//           errorBorder: InputBorder.none,
//           // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
//           // errorBorder: OutlineInputBorder(
//           //     borderRadius: BorderRadius.circular(10),
//           //     borderSide: BorderSide(
//           //       color: AppColors.white,
//           //       // width: 100,
//           //       style: BorderStyle.solid,
//           //     )),
//           // ignore: prefer_const_constructors
//           hintStyle: TextStyle(
//             color: Colors.black54,
//             fontSize: 13,
//             fontWeight: FontWeight.w500,
//           ),
//           filled: true,
//           alignLabelWithHint: true,
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool obscureText;
  final Function validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final String hintText;
  final double? padding;
  final Function()? onTap;
  final TextInputType type;
  DefaultTextFormField(
      {required this.controller,
      this.obscureText = false,
      this.onTap,
      this.height,
      this.padding,
      this.type = TextInputType.text,
      this.width,
      required this.validator,
      this.prefixIcon = const Icon(Icons.person),
      this.suffixIcon,
      this.hintText = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        maxLines: 1,
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        cursorColor: AppColors.primary,
        keyboardType: type,
        enabled: true,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.blackColor),
        validator: (value) => validator(value),
        decoration: InputDecoration(
          helperText: ' ',
          fillColor: Colors.grey.shade200,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.white,
                // width: 100,
                style: BorderStyle.none,
              )),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
