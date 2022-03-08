import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:poc/utils/export/repositories.dart';
import 'package:poc/utils/export/blocs.dart';

import 'app.dart';

void main() async {
  // Allow to use native code
  WidgetsFlutterBinding.ensureInitialized();

  // Native code
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () {
      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (_) => AuthenticationRepository()),
            RepositoryProvider(create: (_) => UserRepository()),
            RepositoryProvider(create: (_) => ProductRepository()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext context) => AuthenticationBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                  userRepository: context.read<UserRepository>(),
                ),
              ),
              BlocProvider<LoginBloc>(
                create: (BuildContext context) => LoginBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                ),
              ),
              BlocProvider<CounterBloc>(
                create: (BuildContext context) => CounterBloc(),
              ),
              BlocProvider<ProductListBloc>(
                create: (BuildContext context) => ProductListBloc(
                  productRepository: context.read<ProductRepository>(),
                ),
              ),
            ],
            child: const App(),
          ),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
    storage: storage,
  );
}
