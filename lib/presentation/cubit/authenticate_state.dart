part of 'authenticate_cubit.dart';

abstract class AuthenticateState extends Equatable {
  const AuthenticateState();
}

class AuthenticateInitial extends AuthenticateState {
  @override
  List<Object?> get props => [];
}

class AuthenticateLoginSuccessState extends AuthenticateState {
  final UserModel userModel;
  const AuthenticateLoginSuccessState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class AuthenticateLoginErrorState extends AuthenticateState {
  final String meesage;

  const AuthenticateLoginErrorState({
    required this.meesage,
  });

  @override
  List<Object> get props => [meesage];
}

class AuthenticateLoadingState extends AuthenticateState {
  @override
  List<Object?> get props => [];
}

class AuthenticateCubitMessageUpdateState extends AuthenticateState {
  String message;
  AuthenticateCubitMessageUpdateState({
    required this.message,
  });
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class ChangeVisiblityState extends AuthenticateState {
  @override
  List<Object?> get props => [];
}

class ChangeVisiblitySuccessState extends AuthenticateState {
  @override
  List<Object?> get props => [];
}

// sign up
class AuthenticateSignUpSuccessState extends AuthenticateState {
  final UserModel userModel;
  const AuthenticateSignUpSuccessState(this.userModel);
  @override
  List<Object> get props => [userModel];
}

class AuthenticateSignUpErrorState extends AuthenticateState {
  final String meesage;
  const AuthenticateSignUpErrorState({
    required this.meesage,
  });

  @override
  List<Object> get props => [meesage];
}

class ChangeDropDownValue extends AuthenticateState {
  @override
  List<Object?> get props => [];
}

class ChangeDropDownValueSucess extends AuthenticateState {
  @override
  List<Object?> get props => [];
}
