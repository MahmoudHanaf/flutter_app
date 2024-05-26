import 'package:flutter/material.dart';

void navigate(BuildContext context,{required String routeName})=>
  Navigator.pushNamed(context, routeName);

void navigateAndDelete(BuildContext context , {required String routeName}) =>
Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);

void pop(BuildContext context){
  Navigator.of(context).pop();
}