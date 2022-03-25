import 'package:flutter_test/flutter_test.dart';
import 'package:poc/blocs/login/login_bloc/login_bloc.dart';
void main() {
  const email = 'mock-email';
  const password = 'mock-password';
  group('LoginEvent', () {
    group('LoginEmailChanged', () {
      test('supports value comparisons', () {
        expect(const LoginEmailChanged(email:email), const LoginEmailChanged(email:email));
      });
    });

    group('LoginPasswordChanged', () {
      test('supports value comparisons', () {
        expect(const LoginPasswordChanged(password:password), const LoginPasswordChanged(password:password));
      });
    });

    group('LoginSubmitted', () {
      test('supports value comparisons', () {
        expect(const LoginSubmitted(), const LoginSubmitted());
      });
    });
  });
}
