import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/entities/user_entity.dart';
import 'package:flutter_app/domain/usecases/login_usecase.dart';
import 'package:flutter_app/domain/usecases/signup_usecase.dart';

abstract class Repositry {
  Future<Either<Failure, UserModel>> login(LoginUsecaseInput input);

  Future<Either<Failure, UserModel>> signUp(SignUpUsecaseInput input);

  Future<Either<Failure, User>> getData();
}
