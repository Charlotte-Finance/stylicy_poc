import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc/repositories/login/authentication_repository.dart';

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
