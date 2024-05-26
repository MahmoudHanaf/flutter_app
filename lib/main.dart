import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/network/cache_helper.dart';
import 'package:flutter_app/depdency_injection.dart' as di;
// import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
