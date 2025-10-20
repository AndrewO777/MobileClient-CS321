// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      message: json['message'] as String?,
      datePosted: DateTime.parse(json['datePosted'] as String),
      schoolId: (json['schoolId'] as num).toInt(),
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'datePosted': instance.datePosted.toIso8601String(),
      'schoolId': instance.schoolId,
    };
