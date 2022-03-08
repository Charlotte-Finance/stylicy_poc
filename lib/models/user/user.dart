import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User  {
  const User({
    required this.id,
    required this.username,
    required this.password,
  });

  final String id;
  final String username;
  final String password;


  static const empty = User(id: '', username: '', password: '');

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
