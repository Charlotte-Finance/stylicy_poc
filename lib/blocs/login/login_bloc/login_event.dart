part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginPasswordVisibilityChanged extends LoginEvent {
  const LoginPasswordVisibilityChanged();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginSkipped extends LoginEvent {
  const LoginSkipped();
}

class LoginReset extends LoginEvent {
  const LoginReset();
}
