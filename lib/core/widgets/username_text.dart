import 'package:flutter/material.dart';

import 'package:flutter_app/core/utils/app_colors.dart';

class UsernameTextField extends StatelessWidget {
  String labelText;
  Color labelColor ;
  TextEditingController controller;
  String? Function(String? value)? validator;
  
  UsernameTextField({
    Key? key,
    required this.controller,
    this.labelText = 'رقم الهاتف',
    this.labelColor = Colors.cyan,
    this.validator ,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: controller,
                    validator: validator,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: labelText,
                        labelStyle: TextStyle(
                          color: labelColor,
                          fontSize: 25,
                        )),
                  ),
                );
  }
}
