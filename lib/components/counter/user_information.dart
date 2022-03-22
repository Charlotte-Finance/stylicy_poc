import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/authentication_bloc/authentication_bloc.dart';



class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context) {
            final userId = context.select(
              (AuthenticationBloc bloc) => bloc.state.user.id,
            );
            return Text('UserID: $userId');
          },
        ),
        ElevatedButton(
          child: const Text('Logout'),
          onPressed: () {
            context.read<AuthenticationBloc>().add(
                  AuthenticationLogoutRequested(),
                );
          },
        ),
      ],
    );
  }
}
