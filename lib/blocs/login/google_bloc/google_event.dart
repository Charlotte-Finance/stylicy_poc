part of 'google_bloc.dart';

abstract class GoogleEvent extends Equatable {
  const GoogleEvent();

  @override
  List<Object> get props => [];
}

class GoogleLoginRequested extends GoogleEvent {
  const GoogleLoginRequested();

  @override
  List<Object> get props => [];
}
