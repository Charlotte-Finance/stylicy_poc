part of 'google_bloc.dart';

enum GoogleStatus { initial, loading, success, failure }

@JsonSerializable()
class GoogleState extends Equatable {
  final GoogleStatus status;

  const GoogleState({
    this.status = GoogleStatus.initial,
  });

  GoogleState copyWith({
    GoogleStatus? status,
  }) {
    return GoogleState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
