part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final FormzStatus status;
  final Email email;
  final Password password;
  final bool obscurePassword;

  const RegisterState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.obscurePassword = true,
  });

  RegisterState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    bool? obscurePassword,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object> get props => [status, email, password, obscurePassword];
}
