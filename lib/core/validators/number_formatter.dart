// import 'package:flutter/services.dart';
// import 'package:teacher_control/core/validators/phone_numer_validator.dart';

// class CustomNumberInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     final String newText = newValue.text;

//     if (NumberInputValidator.validate(newText) == null) {
//       return newValue; // Input is valid, allow it
//     } else {
//       // Input is invalid, revert to the previous value
//       return oldValue;
//     }
//   }
// }