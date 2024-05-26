import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/domain/repositories/repositry.dart';
import 'package:flutter_app/domain/usecases/login_usecase.dart';
import 'package:flutter_app/domain/usecases/signup_usecase.dart';
import 'package:flutter_app/presentation/widgets/alert_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/core/global/global_variables.dart';
import 'package:flutter_app/core/utils/app_colors.dart';

import '../../domain/entities/user_entity.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  LoginUsecase loginUsecase;
  SignUpUsecase signUpUsecase;
  AuthenticateCubit(this.loginUsecase, this.signUpUsecase)
      : super(AuthenticateInitial());
  static AuthenticateCubit of(context) =>
      BlocProvider.of<AuthenticateCubit>(context);

  Future<void> login(String phone, String password) async {
    emit(AuthenticateLoadingState());
    await (await loginUsecase.call(
      LoginUsecaseInput(phone: phone, password: password),
    ))
        .fold((failure) {
      emit(AuthenticateLoginErrorState(
          meesage: failure.toString() == ("Instance of 'SystemFailure'")
              ? "حدث خطأ ما برجاء إعادة المحاولة"
              : failure.toString()));
    }, (data) async {
      emit(AuthenticateLoginSuccessState(data));
    });
  }

  bool visiblity = true;
  void changeVisibility() {
    emit(ChangeVisiblityState());
    visiblity = !visiblity;
    emit(ChangeVisiblitySuccessState());
  }

  String? dropDownValue;

  void changeDropDownValue(String value) {
    emit(ChangeDropDownValue());
    dropDownValue = value;
    emit(ChangeDropDownValueSucess());
  }

// sign up
  Future<void> signUp(
    String name,
    String phone,
    String password,
    int level,
  ) async {
    emit(AuthenticateLoadingState());
    await (await signUpUsecase.call(
      SignUpUsecaseInput(
          name: name, phone: phone, password: password, level: level),
    ))
        .fold((failure) {
      emit(AuthenticateSignUpErrorState(
          meesage: failure.toString() == ("Instance of 'SystemFailure'")
              ? "حدث خطأ ما برجاء إعادة المحاولة"
              : failure.toString()));
    }, (data) async {
      emit(AuthenticateSignUpSuccessState(data));
    });
  }
}
