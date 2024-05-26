import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flutter_app/core/api/dio_consumer.dart';
import 'package:flutter_app/core/api/end_points.dart';
import 'package:flutter_app/core/errors/exceptions.dart';
import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/core/network/error_messege_model.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/usecases/login_usecase.dart';
import 'package:flutter_app/domain/usecases/signup_usecase.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, Map<String, dynamic>>> login(LoginUsecaseInput input);
  Future<Either<Failure, Map<String, dynamic>>> signUp(
      SignUpUsecaseInput input);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  DioConsumer dioConsumer;
  RemoteDataSourceImpl(
    this.dioConsumer,
  );

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      LoginUsecaseInput input) async {
    // final response = await dioConsumer.post(EndPoints.login,
    //     body: {"phone": input.phone, "password": input.password});

    final response = await Dio().post(EndPoints.login,
        data: {"phone": input.phone, "password": input.password});
    if (response.statusCode == 200) {
      print(jsonDecode(response.data));
      return Right(jsonDecode(response.data));
    } else {
      throw ServerException(
        jsonDecode(response.data),
      );
    }
  }

  /// sign up
  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp(
      SignUpUsecaseInput input) async {
    final response = await Dio().post(EndPoints.signup, data: {
      "name": input.name,
      "phone": input.phone,
      "password": input.password,
      "level": input.level
    });
    if (response.statusCode == 200) {
      print(jsonDecode(response.data));
      return Right(jsonDecode(response.data));
    } else {
      throw ServerException(
        jsonDecode(response.data),
      );
    }
  }
}
