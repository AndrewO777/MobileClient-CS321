// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Campus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campus _$CampusFromJson(Map<String, dynamic> json) => Campus(
      id: (json['id'] as num).toInt(),
      Name: json['Name'] as String,
      AddressId: (json['AddressId'] as num).toInt(),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      SchoolId: (json['SchoolId'] as num).toInt(),
      school: School.fromJson(json['school'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CampusToJson(Campus instance) => <String, dynamic>{
      'id': instance.id,
      'Name': instance.Name,
      'AddressId': instance.AddressId,
      'address': instance.address,
      'SchoolId': instance.SchoolId,
      'school': instance.school,
    };
