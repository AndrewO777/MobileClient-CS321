// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Campus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campus _$CampusFromJson(Map<String, dynamic> json) => Campus(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      addressId: (json['addressId'] as num).toInt(),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      schoolId: (json['schoolId'] as num).toInt(),
      school: json['school'] == null
          ? null
          : School.fromJson(json['school'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CampusToJson(Campus instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'addressId': instance.addressId,
      'address': instance.address,
      'schoolId': instance.schoolId,
      'school': instance.school,
    };
