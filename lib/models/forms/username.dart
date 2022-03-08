import 'package:json_annotation/json_annotation.dart';

import 'formz.dart';
part 'username.g.dart';

enum UsernameValidationError { empty }

@JsonSerializable()
class Username extends FormzInput<String, UsernameValidationError> {
  const Username() : super.dirty('');
  const Username.pure() : super.pure('');
  const Username.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UsernameValidationError.empty;
  }

  factory Username.fromJson(Map<String,dynamic> data) => _$UsernameFromJson(data);

  Map<String,dynamic> toJson() => _$UsernameToJson(this);
}
