part of 'facebook_bloc.dart';

enum FacebookStatus { initial, loading, success, failure }

@JsonSerializable()
class FacebookState extends Equatable {
  final FacebookStatus status;

  const FacebookState({
    this.status = FacebookStatus.initial,
  });

  FacebookState copyWith({
    FacebookStatus? status,
  }) {
    return FacebookState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
