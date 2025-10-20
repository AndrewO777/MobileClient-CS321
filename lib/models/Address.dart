import 'package:json_annotation/json_annotation.dart';
import 'GpsCoordinate.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address {
  int id;
  int? gpsCoordinateId;
  GpsCoordinate? gpsCoordinates;
  String streetAddress1;
  String? streetAddress2;
  String city;
  String state;
  String postalCode;
  @JsonKey(defaultValue: 'USA')
  String country;

  Address({
    required this.id,
    this.gpsCoordinateId,
    this.gpsCoordinates,
    required this.streetAddress1,
    this.streetAddress2,
    required this.city,
    required this.state,
    required this.postalCode,
    this.country = 'USA',
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
