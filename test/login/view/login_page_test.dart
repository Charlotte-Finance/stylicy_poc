import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc/components/login/login_form.dart';
import 'package:poc/pages/login_page.dart';
import 'package:poc/repositories/authentication_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('LoginPage', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
    });

    // test('is routable', () {
    //   expect(LoginPage.route(), isA<MaterialPageRoute>());
    // });

    // testWidgets('renders a LoginForm', (tester) async {
    //   await tester.pumpWidget(
    //     RepositoryProvider.value(
    //       value: authenticationRepository,
    //       child: const MaterialApp(
    //         home: Scaffold(body: LoginPage()),
    //       ),
    //     ),
    //   );
    //   expect(find.byType(LoginForm), findsOneWidget);
    // });
  });
}
