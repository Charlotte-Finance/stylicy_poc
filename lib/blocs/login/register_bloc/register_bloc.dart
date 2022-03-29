import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:poc/repositories/login/authentication_repository.dart';

import '../../../models/login/forms/email.dart';
import '../../../models/login/forms/formz.dart';
import '../../../models/login/forms/password.dart';
import '../../../repositories/login/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterSubmitted>(_onSubmitted);
    on<RegisterPasswordVisibilityChanged>(_onLoginPasswordVisibilityChanged);
    on<RegisterReset>(_onRegisterReset);

  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onLoginPasswordVisibilityChanged(
    RegisterPasswordVisibilityChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final User? user = (await
        _auth.createUserWithEmailAndPassword(
          email: state.email.value,
          password: state.password.value,
        )).user;
        await _authenticationRepository.signIn(
            email: state.email.value, password: state.password.value);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void _onRegisterReset(
    RegisterReset event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState());
  }
}
