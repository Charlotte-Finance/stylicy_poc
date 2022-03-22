part of 'counter_bloc.dart';

enum CounterStatus { initial, loading, success, failure }

extension CounterStatusX on CounterStatus {
  bool get isInitial => this == CounterStatus.initial;

  bool get isLoading => this == CounterStatus.loading;

  bool get isSuccess => this == CounterStatus.success;

  bool get isFailure => this == CounterStatus.failure;
}

@JsonSerializable()
class CounterState extends Equatable {
  final CounterStatus status;
  final int value;

  const CounterState({
    this.status = CounterStatus.initial,
    int? value,
  }) : value = value ?? 0;

  CounterState copyWith({
    CounterStatus? status,
    int? value,
  }) {
    return CounterState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }

  factory CounterState.fromJson(Map<String, dynamic> json) =>
      _$CounterStateFromJson(json);

  Map<String, dynamic> toJson() => _$CounterStateToJson(this);

  @override
  List<Object> get props => [status, value];
}
