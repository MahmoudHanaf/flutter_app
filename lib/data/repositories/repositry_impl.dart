import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/core/errors/exceptions.dart';

import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/data/datasources/local_datasource.dart';
import 'package:flutter_app/data/datasources/remote_data_source.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/entities/user_entity.dart';
import 'package:flutter_app/domain/repositories/repositry.dart';
import 'package:flutter_app/domain/usecases/login_usecase.dart';
import 'package:flutter_app/domain/usecases/signup_usecase.dart';

class RepositryImpl extends Repositry {
  RemoteDataSource remoteDataSource;
  RepositryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> login(LoginUsecaseInput input) async {
    try {
      final response = await remoteDataSource.login(input);
      print("****************");
      print(response);
      var json;
      response.fold(
          (l) => throw (ServerException(l.toString())), (r) => json = r);
      if (json['status'] == 'error') {
        throw (ServerException(json["message"]));
      } else {
        UserModel user = UserModel.fromJson(json["data"]);
        return Right(user);
      }
    } catch (e) {
      if (e.runtimeType == ServerException) {
        return Left(ServerFailure(message: e.toString()));
      }
      return Left(SystemFailure(message: e.toString()));
    }
  }

  ///  sign up
  @override
  Future<Either<Failure, UserModel>> signUp(SignUpUsecaseInput input) async {
    try {
      final response = await remoteDataSource.signUp(input);
      print("************************");
      print(response);
      var json;
      response.fold(
          (l) => throw (ServerException(l.toString())), (r) => json = r);
      if (json['status'] == 'error') {
        throw (ServerException(json["message"]));
      } else {
        UserModel user = UserModel.fromJson(json["data"]);
        return Right(user);
      }
    } catch (e) {
      if (e.runtimeType == ServerException) {
        return Left(ServerFailure(message: e.toString()));
      }
      return Left(SystemFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }
}
