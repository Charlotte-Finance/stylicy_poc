import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../repositories/login/authentication_repository.dart';

part 'facebook_event.dart';
part 'facebook_state.dart';

class FacebookBloc extends Bloc<FacebookEvent, FacebookState> {
  final AuthenticationRepository authenticationRepository;

  FacebookBloc({required this.authenticationRepository})
      : super(const FacebookState()) {
    on<FacebookLoginRequested>(_onLogin);
  }

  Future<void> _onLogin(
      FacebookLoginRequested event, Emitter<FacebookState> emit) async {
    emit(state.copyWith(status: FacebookStatus.loading));
    try {
      await authenticationRepository.facebookLogIn();
      return emit(
        state.copyWith(
          status: FacebookStatus.success,
        ),
      );
    } catch (_) {
      return emit(
        state.copyWith(status: FacebookStatus.failure),
      );
    }
  }
}
