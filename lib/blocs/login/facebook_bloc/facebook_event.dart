part of 'facebook_bloc.dart';

abstract class FacebookEvent extends Equatable {
  const FacebookEvent();

  @override
  List<Object> get props => [];
}

class FacebookLoginRequested extends FacebookEvent {
  const FacebookLoginRequested();

  @override
  List<Object> get props => [];
}
