// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../utils/app_colors.dart';
import '../utils/hex_color.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  TextInputType keyboardType;
  bool obscureText;
  final Icon prefixIcon;
  final Function(String)? onChanged;
  Widget? suffixIcon;
  Function? suffixFunction;
  Function(String) onSubmit; 
  String? Function(String? value) validator;
  bool isPassword;
  List<TextInputFormatter>? formatter; 
  bool autoValidate;

  MyTextField(
    {
    required this.hintText,
    required this.obscureText,
    this.autoValidate = false,
    this.keyboardType = TextInputType.name,
    required this.prefixIcon,
    this.onChanged,
    this.suffixIcon,
    this.suffixFunction,
    required this.onSubmit, this.controller,
    required this.validator,
    this.formatter ,
    this.isPassword = false,
  }) ;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.primary,
      validator: widget.validator,
      inputFormatters: widget.formatter,
      // autovalidateMode: widget.autoValidate ? AutovalidateMode.always : null,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value){

        if(widget.onSubmit != null){
          widget.onSubmit!(value);
        }
      },      
      onChanged: (value){
        if(widget.onChanged != null){
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
        
        hintText: widget.hintText,
        fillColor: HexColor("#f0f3f1"),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintStyle: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 15,
          color: HexColor("#8d8d8d"),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
          
        prefixIcon: widget.prefixIcon,
        prefixIconColor: HexColor("#4f4f4f"),
        
        suffixIcon:  widget.suffixIcon,
      
        
        filled: true,
      ),
    );
  }
}
