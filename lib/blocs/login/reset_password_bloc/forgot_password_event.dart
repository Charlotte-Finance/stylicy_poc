part of 'forgot_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordRequested extends ResetPasswordEvent {

  const ForgotPasswordRequested();

  @override
  List<Object> get props => [];
}

class ResetPasswordEmailChanged extends ResetPasswordEvent {
  final String email;

  const ResetPasswordEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class ResetEmailSent extends ResetPasswordEvent {

  const ResetEmailSent();

  @override
  List<Object> get props => [];
}
