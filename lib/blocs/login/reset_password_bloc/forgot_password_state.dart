part of 'forgot_password_bloc.dart';


class ForgotPasswordState extends Equatable {
  final FormzStatus status;
  final Email email;

  const ForgotPasswordState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
  });

  ForgotPasswordState copyWith({
    FormzStatus? status,
    Email? email,
    bool? isOpen,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [status, email];
}
