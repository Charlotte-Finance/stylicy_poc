import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc/blocs/login/authentication_bloc/authentication_bloc.dart';
import 'package:poc/models/login/user/user.dart';
import 'package:poc/repositories/login/authentication_repository.dart';
import 'package:poc/repositories/login/user_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  const user = User.empty;

  late AuthenticationRepository authenticationRepository;
  late UserRepository userRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    when(() => authenticationRepository.status)
        .thenAnswer((_) => const Stream.empty());
    userRepository = MockUserRepository();
  });

  group('AuthenticationBloc', () {
    test('initial state is AuthenticationState.unknown', () {
      final authenticationBloc = AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      );
      expect(authenticationBloc.state, const AuthenticationState.unknown());
      authenticationBloc.close();
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is unauthenticated',
      setUp: () {
        when(() => authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
      },
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      expect: () =>  <AuthenticationState>[
        AuthenticationState.unauthenticated(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [authenticated] when status is authenticated',
      setUp: () {
        when(() => authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(() => userRepository.getUser()).thenAnswer((_) async => user);
      },
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      expect: () => <AuthenticationState>[
        AuthenticationState.authenticated(user),
      ],
    );
  });

  group('AuthenticationStatusChanged', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [authenticated] when status is authenticated',
      setUp: () {
        when(() => authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(() => userRepository.getUser()).thenAnswer((_) async => user);
      },
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: () => <AuthenticationState>[
        AuthenticationState.authenticated(user),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is unauthenticated',
      setUp: () {
        when(() => authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
      },
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.unauthenticated),
      ),
      expect: () => <AuthenticationState>[
        AuthenticationState.unauthenticated(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is authenticated but getUser fails',
      setUp: () {
        when(() => userRepository.getUser()).thenThrow(Exception('oops'));
      },
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: () => <AuthenticationState>[
        AuthenticationState.unauthenticated(),
      ],
    );



    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unknown] when status is unknown',
      setUp: () {
        when(() => authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unknown),
        );
      },
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.unknown),
      ),
      expect: () => const <AuthenticationState>[
        AuthenticationState.unknown(),
      ],
    );
  });

  group('AuthenticationLogoutRequested', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'calls logOut on authenticationRepository '
      'when AuthenticationLogoutRequested is added',
      build: () => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      act: (bloc) => bloc.add(AuthenticationLogoutRequested()),
      verify: (_) {
        verify(() => authenticationRepository.logOut()).called(1);
      },
    );
  });
}
