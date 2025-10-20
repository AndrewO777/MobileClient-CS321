// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'School.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'website': instance.website,
      'phoneNumber': instance.phoneNumber,
    };
