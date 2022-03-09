import 'package:json_annotation/json_annotation.dart';
import 'package:poc/models/user/geolocation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final Geolocation geolocation;
  final String city;
  final String street;
  final int? number;
  final String zipcode;

  const Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  static const empty = Address(
    geolocation: Geolocation.empty,
    city: '',
    street: '',
    number: null,
    zipcode: '',
  );

  factory Address.fromJson(Map<String, dynamic> data) => _$AddressFromJson(data);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
