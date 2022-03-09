import 'package:json_annotation/json_annotation.dart';

import 'formz.dart';

part 'password.g.dart';

enum PasswordValidationError { empty }

@JsonSerializable()
class Password extends FormzInput<String, PasswordValidationError> {
  const Password() : super.dirty('');
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }


  factory Password.fromJson(Map<String,dynamic> data) => _$PasswordFromJson(data);

  Map<String,dynamic> toJson() => _$PasswordToJson(this);
}
