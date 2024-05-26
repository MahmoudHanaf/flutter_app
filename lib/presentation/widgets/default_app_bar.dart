
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:flutter_svg/svg.dart';

// class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget{
//   final String text;
//   final  bool? isBold ;
//   DefaultAppBar({super.key, required this.text, this.isBold});

//   @override
//   State<DefaultAppBar> createState() => _DefaultAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(50);
// }

// class _DefaultAppBarState extends State<DefaultAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//       title: Text(
//         widget.text,
//         style: widget.isBold ==true ?
//         Theme.of(context)
//               .textTheme
//               .titleLarge
//               ?.copyWith(color: ColorManager.defualtColor, fontSize: 20)
//         :
//         Theme.of(context)
//             .textTheme
//             .labelMedium
//             ?.copyWith(color: ColorManager.blue),
//       ),
//       centerTitle: true,
//        leading: Transform.rotate(
//         angle: language == 'en' ? 0 : 3.14 ,
//         child: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: SvgPicture.asset(ImageAssets.backArrowIc,fit: BoxFit.fill,)),
//       ),
//     );
//   }
// }
