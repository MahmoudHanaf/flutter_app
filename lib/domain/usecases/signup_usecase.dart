import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/data/models/user_model.dart';

import 'package:flutter_app/domain/repositories/repositry.dart';

class SignUpUsecase extends UseCase<UserModel, SignUpUsecaseInput> {
  Repositry repositry;
  SignUpUsecase({
    required this.repositry,
  });

  @override
  Future<Either<Failure, UserModel>> call(SignUpUsecaseInput input) {
    return repositry.signUp(input);
  }
}

class SignUpUsecaseInput {
  String name;
  String phone;
  String password;
  int level;

  SignUpUsecaseInput({
    required this.name,
    required this.phone,
    required this.password,
    required this.level,
  });

  @override
  List<Object> get props => [name, phone, password, level];
}
