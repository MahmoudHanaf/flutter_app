import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/data/models/user_model.dart';

import 'package:flutter_app/domain/repositories/repositry.dart';

class LoginUsecase extends UseCase<UserModel, LoginUsecaseInput> {
  Repositry repositry;
  LoginUsecase({
    required this.repositry,
  });

  @override
  Future<Either<Failure, UserModel>> call(LoginUsecaseInput input) {
    return repositry.login(input);
  }
}

class LoginUsecaseInput {
  String phone;
  String password;

  LoginUsecaseInput({required this.phone, required this.password});

  @override
  List<Object> get props => [phone, password];
}
