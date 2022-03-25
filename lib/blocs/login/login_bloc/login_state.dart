part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final Email email;
  final Password password;
  final bool obscurePassword;

  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.obscurePassword = true,
  });

  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    bool? obscurePassword,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object> get props => [status, email, password, obscurePassword];
}
