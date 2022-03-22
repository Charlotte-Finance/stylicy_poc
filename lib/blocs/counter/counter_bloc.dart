import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'counter_bloc.g.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncremented>(_onIncremented);
    on<CounterDecremented>(_onDecremented);
  }

  void _onIncremented(CounterIncremented event, Emitter<CounterState> emit) {
    return emit(state.copyWith(value: state.value + 1));
  }

  void _onDecremented(CounterDecremented event, Emitter<CounterState> emit) {
    return emit(state.copyWith(value: state.value - 1));
  }

  @override
  CounterState fromJson(Map<String, dynamic> json) =>
      CounterState.fromJson(json);

  @override
  Map<String, dynamic> toJson(CounterState state) => state.toJson();
}
