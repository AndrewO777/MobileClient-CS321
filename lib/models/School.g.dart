// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'School.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      id: (json['id'] as num).toInt(),
      Name: json['Name'] as String,
      Email: json['Email'] as String? ?? '',
      Website: json['Website'] as String? ?? '',
      PhoneNumber: json['PhoneNumber'] as String? ?? '',
      Campuses: (json['Campuses'] as List<dynamic>?)
          ?.map((e) => Campus.fromJson(e as Map<String, dynamic>))
          .toList(),
      SchoolAnnouncements: (json['SchoolAnnouncements'] as List<dynamic>?)
          ?.map((e) => Announcement.fromJson(e as Map<String, dynamic>))
          .toList(),
      schoolNews: (json['schoolNews'] as List<dynamic>?)
          ?.map((e) => SchoolNews.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..SchoolEvents = (json['SchoolEvents'] as List<dynamic>)
        .map((e) => SchoolEvent.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'id': instance.id,
      'Name': instance.Name,
      'Campuses': instance.Campuses,
      'Email': instance.Email,
      'Website': instance.Website,
      'PhoneNumber': instance.PhoneNumber,
      'SchoolAnnouncements': instance.SchoolAnnouncements,
      'SchoolEvents': instance.SchoolEvents,
      'schoolNews': instance.schoolNews,
    };
