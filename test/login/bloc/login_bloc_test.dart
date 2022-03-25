import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc/blocs/login/login_bloc/login_bloc.dart';
import 'package:poc/models/login/forms/formz.dart';
import 'package:poc/models/login/forms/password.dart';
import 'package:poc/models/login/forms/email.dart';
import 'package:poc/repositories/login/authentication_repository.dart';


class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  group('LoginBloc', () {
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc(
        authenticationRepository: authenticationRepository,
      );
      expect(loginBloc.state, const LoginState());
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when login succeeds',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              email: 'email',
              password: 'password',
            ),
          ).thenAnswer((_) => Future.value('user'));
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginEmailChanged(email:'email'))
            ..add(const LoginPasswordChanged(password:'password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            email: Email.dirty('email'),
            status: FormzStatus.invalid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.valid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionInProgress,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionSuccess,
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [LoginInProgress, LoginFailure] when logIn fails',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              email: 'email',
              password: 'password',
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginEmailChanged(email:'email'))
            ..add(const LoginPasswordChanged(password:'password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            email: Email.dirty('email'),
            status: FormzStatus.invalid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.valid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionInProgress,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionFailure,
          ),
        ],
      );
    });
  });
}
