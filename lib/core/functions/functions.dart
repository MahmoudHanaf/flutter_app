import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/presentation/widgets/loading.dart';
import 'package:intl/intl.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppFunctions {
  static String reverseString(String originalString) {
    List<String> charList = originalString.split('');
    List<String> reversedList = charList.reversed.toList();
    String reversedString = reversedList.join();

    return reversedString;
  }

  static void showLoadingPage(
    String text,
    String description,
    BuildContext context,
  ) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(context: context, builder: (context) => const Loading());
      // showDialog(context: context, builder: (context) => SuccessAndErrorAlert(title: text, description: description),);
    });
  }

  static void showsToast(
    BuildContext context, {
    int seconds = 5,
    required String text,
    required Color color,
  }) {
    showToast(
      text,
      context: context,
      backgroundColor: color,
      animation: StyledToastAnimation.slideFromRightFade,
      reverseAnimation: StyledToastAnimation.fadeScale,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: Duration(seconds: seconds),
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeInOutCirc,
    );
  }

  static void showsSimpleToast(String text, Color color, BuildContext context,
      {int seconds = 5}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[400],
        textColor: Colors.black38,
        fontSize: 18.0);
  }

  static String prettyTime(String timeString) {
    DateTime time = DateTime.parse("2023-01-01 $timeString");

    String formattedTime = DateFormat('h:mm a').format(time);

    return formattedTime;
  }

  static String prettyDate(String dateString) {
    DateTime date = DateTime.parse(dateString);

    String formattedTime = DateFormat('MM-dd').format(date);

    return formattedTime;
  }
}
