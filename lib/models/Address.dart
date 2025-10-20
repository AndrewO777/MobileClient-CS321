import 'package:json_annotation/json_annotation.dart';
import 'GpsCoordinate.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address {
  int id;
  int? gpsCoordinateId;
  GpsCoordinate? gpsCoordinates;
  String? streetAddress1;
  String? streetAddress2;
  String? city;
  String? state;
  String? postalCode;
  @JsonKey(defaultValue: 'USA')
  String country;

  Address({
    required this.id,
    this.gpsCoordinateId,
    this.gpsCoordinates,
    this.streetAddress1,
    this.streetAddress2,
    this.city,
    this.state,
    this.postalCode,
    this.country = 'USA',
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
