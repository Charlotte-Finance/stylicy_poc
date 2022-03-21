import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poc/repositories/login/authentication_repository.dart';
import 'package:poc/repositories/product_repository.dart';
import 'package:poc/repositories/login/user_repository.dart';

import 'app.dart';
import 'blocs/bloc_observer.dart';
import 'blocs/counter_bloc/counter_bloc.dart';
import 'blocs/login/authentication_bloc/authentication_bloc.dart';
import 'blocs/login/login_bloc/login_bloc.dart';
import 'blocs/product_list_bloc/product_list_bloc.dart';

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
