import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class Name {
  final String firstname;
  final String lastname;

  const Name({required this.firstname, required this.lastname});

  static const empty = Name(firstname: '', lastname: '');

  factory Name.fromJson(Map<String, dynamic> data) => _$NameFromJson(data);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
