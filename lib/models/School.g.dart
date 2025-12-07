// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'School.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  email: json['email'] as String? ?? '',
  website: json['website'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  campuses:
      (json['campuses'] as List<dynamic>?)
          ?.map((e) => Campus.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  schoolAnnouncements:
      (json['schoolAnnouncements'] as List<dynamic>?)
          ?.map((e) => Announcement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  schoolEvents:
      (json['schoolEvents'] as List<dynamic>?)
          ?.map((e) => SchoolEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'campuses': instance.campuses.map((e) => e.toJson()).toList(),
  'email': instance.email,
  'website': instance.website,
  'phoneNumber': instance.phoneNumber,
  'schoolAnnouncements': instance.schoolAnnouncements
      .map((e) => e.toJson())
      .toList(),
  'schoolEvents': instance.schoolEvents.map((e) => e.toJson()).toList(),
};
