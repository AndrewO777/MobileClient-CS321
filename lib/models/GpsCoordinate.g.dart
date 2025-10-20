// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GpsCoordinate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GpsCoordinate _$GpsCoordinateFromJson(Map<String, dynamic> json) =>
    GpsCoordinate(
      id: (json['id'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GpsCoordinateToJson(GpsCoordinate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
