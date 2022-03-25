import 'package:json_annotation/json_annotation.dart';

import 'formz.dart';

part 'email.g.dart';

enum EmailValidationError { empty }

@JsonSerializable()
class Email extends FormzInput<String, EmailValidationError> {
  const Email() : super.dirty('');
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : EmailValidationError.empty;
  }

  factory Email.fromJson(Map<String,dynamic> data) => _$EmailFromJson(data);

  Map<String,dynamic> toJson() => _$EmailToJson(this);
}
