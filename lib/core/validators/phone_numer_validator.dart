import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final oldText = oldValue.text;
    final newText = newValue.text;

    // Remove all non-digit characters from the new text
    final sanitizedText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Create a formatted phone number
    // final formattedText = _formatPhoneNumber(sanitizedText);

    return TextEditingValue(
      text: sanitizedText,
      selection: TextSelection.collapsed(offset: sanitizedText.length),
    );
  }

  // String _formatPhoneNumber(String text) {
  //   if (text.length <= 2) {
  //     return text;
  //   } else if (text.length <= 7) {
  //     return '(${text.substring(0, 3)}) ${text.substring(3)}';
  //   } else {
  //     return '(${text.substring(0, 3)}) ${text.substring(3, 7)} ${text.substring(7)}';
  //   }
  // }
}

class PhoneNumberValidator {
  static String? validate(dynamic value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }

    final sanitizedValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (sanitizedValue.length != 11) {
      return 'Phone number must have 11 digits';
    }

    final validPrefixes = ['010', '011', '012', '013', '014', '015', '016', '017', '018', '019'];
    final prefix = sanitizedValue.substring(0, 3);
    if (!validPrefixes.contains(prefix)) {
      return 'Phone number must start with one of the valid prefixes';
    }

    return null;
  }
}
