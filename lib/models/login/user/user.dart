import 'package:json_annotation/json_annotation.dart';

import 'name.dart';
import 'address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.iV,
  });

  final Address address;
  final int? id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final String phone;
  final int? iV;

  static const empty = User(
    address: Address.empty,
    id: null,
    email: '',
    username: '',
    password: '',
    name: Name.empty,
    phone: '',
    iV: null,
  );

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
