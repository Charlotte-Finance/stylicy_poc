part of '../login_tab.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.alternate_email_outlined),
                labelText: AppLocalizations.of(context)!.email_form.toUpperCase(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility_outlined),
                labelText: AppLocalizations.of(context)!.password_form.toUpperCase(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                  enableDrag: false,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  context: context,
                  builder: (builder) {
                    return const ResetPasswordPopUp();
                  });
            },
            child: Text(AppLocalizations.of(context)!.forget_pwd_button,
            ),
          ),
        ),
      ],
    );
  }
}

//
// class LoginForm extends StatelessWidget {
//   const LoginForm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state.status.isSubmissionFailure) {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               const SnackBar(content: Text('Authentication Failure')),
//             );
//         }
//       },
//       child: Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _UsernameInput(),
//             const Padding(padding: EdgeInsets.all(12)),
//             _PasswordInput(),
//             const Padding(padding: EdgeInsets.all(12)),
//             _LoginButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _UsernameInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       buildWhen: (previous, current) => previous.username != current.username,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('loginForm_usernameInput_textField'),
//           onChanged: (username) =>
//               context.read<LoginBloc>().add(LoginUsernameChanged(username)),
//           decoration: InputDecoration(
//             labelText: 'username',
//             errorText: state.username.invalid ? 'invalid username' : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('loginForm_passwordInput_textField'),
//           onChanged: (password) =>
//               context.read<LoginBloc>().add(LoginPasswordChanged(password)),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'password',
//             errorText: state.password.invalid ? 'invalid password' : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       buildWhen: (previous, current) => previous.status != current.status,
//       builder: (context, state) {
//         return state.status.isSubmissionInProgress
//             ? const CircularProgressIndicator()
//             : ElevatedButton(
//           key: const Key('loginForm_continue_raisedButton'),
//           child: const Text('Login'),
//           onPressed: state.status.isValidated
//               ? () {
//             context.read<LoginBloc>().add(const LoginSubmitted());
//           }
//               : null,
//         );
//       },
//     );
//   }
// }
