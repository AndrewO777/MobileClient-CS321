import 'package:json_annotation/json_annotation.dart';

part 'GpsCoordinate.g.dart';

@JsonSerializable()
class GpsCoordinate {
  int id;
  double latitude;
  double longitude;

  GpsCoordinate({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  factory GpsCoordinate.fromJson(Map<String, dynamic> json) => _$GpsCoordinateFromJson(json);
  Map<String, dynamic> toJson() => _$GpsCoordinateToJson(this);

  @override
  String toString() => '$latitude, $longitude';
}
