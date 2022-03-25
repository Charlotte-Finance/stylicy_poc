import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/login/forms/email.dart';
import '../../../models/login/forms/formz.dart';
import '../../../repositories/login/email_repository.dart';

part 'forgot_password_state.dart';

part 'forgot_password_event.dart';

class ForgotPasswordBloc extends Bloc<ResetPasswordEvent, ForgotPasswordState> {
  final EmailRepository _emailRepository;

  ForgotPasswordBloc({required EmailRepository emailRepository})
      : _emailRepository = emailRepository,
        super(const ForgotPasswordState()) {
    on<ResetPasswordEmailChanged>(_onEmailChanged);
    on<ResetEmailSent>(_onEmailSent);
    on<ForgotPasswordRequested>(_onRequest);

  }

  void _onEmailChanged(
    ResetPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email]),
    ));
  }

  void _onEmailSent(
    ResetEmailSent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _emailRepository.resetPassword(email: state.email.value);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void _onRequest(
      ForgotPasswordRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(const ForgotPasswordState());
  }


}
