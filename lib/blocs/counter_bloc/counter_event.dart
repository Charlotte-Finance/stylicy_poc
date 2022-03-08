part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterIncremented extends CounterEvent {
  @override
  List<Object> get props => [];
}

class CounterDecremented extends CounterEvent {
  @override
  List<Object> get props => [];
}
