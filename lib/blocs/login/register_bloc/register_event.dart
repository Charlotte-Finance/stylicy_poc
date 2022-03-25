part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  const RegisterEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  const RegisterPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class RegisterPasswordVisibilityChanged extends RegisterEvent {
  const RegisterPasswordVisibilityChanged();
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}

class RegisterReset extends RegisterEvent {
  const RegisterReset();
}
