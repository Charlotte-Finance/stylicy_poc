// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CounterState _$CounterStateFromJson(Map<String, dynamic> json) => CounterState(
      status: $enumDecodeNullable(_$CounterStatusEnumMap, json['status']) ??
          CounterStatus.initial,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$CounterStateToJson(CounterState instance) =>
    <String, dynamic>{
      'status': _$CounterStatusEnumMap[instance.status],
      'value': instance.value,
    };

const _$CounterStatusEnumMap = {
  CounterStatus.initial: 'initial',
  CounterStatus.loading: 'loading',
  CounterStatus.success: 'success',
  CounterStatus.failure: 'failure',
};
