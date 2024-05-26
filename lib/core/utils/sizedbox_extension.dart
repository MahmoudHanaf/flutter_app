import 'dart:core';

import 'package:flutter/material.dart';


extension spaceing on num{
  SizedBox  get ph => SizedBox(height: this.toDouble(),);
  SizedBox get pw => SizedBox(width: this.toDouble(),);
}