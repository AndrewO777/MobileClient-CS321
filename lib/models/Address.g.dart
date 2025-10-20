// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num).toInt(),
      gpsCoordinateId: (json['gpsCoordinateId'] as num?)?.toInt(),
      gpsCoordinates: json['gpsCoordinates'] == null
          ? null
          : GpsCoordinate.fromJson(
              json['gpsCoordinates'] as Map<String, dynamic>),
      streetAddress1: json['streetAddress1'] as String?,
      streetAddress2: json['streetAddress2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String? ?? 'USA',
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'gpsCoordinateId': instance.gpsCoordinateId,
      'gpsCoordinates': instance.gpsCoordinates,
      'streetAddress1': instance.streetAddress1,
      'streetAddress2': instance.streetAddress2,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
    };
