import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../repositories/login/authentication_repository.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  final AuthenticationRepository authenticationRepository;

  GoogleBloc({required this.authenticationRepository})
      : super(const GoogleState()) {
    on<GoogleLoginRequested>(_onLogin);
  }

  Future<void> _onLogin(
      GoogleLoginRequested event, Emitter<GoogleState> emit) async {
    emit(state.copyWith(status: GoogleStatus.loading));
    try {
      await authenticationRepository.googleLogIn();
      return emit(
        state.copyWith(
          status: GoogleStatus.success,
        ),
      );
    } catch (_) {
      return emit(
        state.copyWith(status: GoogleStatus.failure),
      );
    }
  }
}
