import 'package:json_annotation/json_annotation.dart';

part 'geolocation.g.dart';

@JsonSerializable()
class Geolocation {
  final String lat;
  final String long;

  const Geolocation({required this.lat, required this.long});

  static const empty = Geolocation(lat: '', long: '');

  factory Geolocation.fromJson(Map<String, dynamic> data) => _$GeolocationFromJson(data);

  Map<String, dynamic> toJson() => _$GeolocationToJson(this);
}
