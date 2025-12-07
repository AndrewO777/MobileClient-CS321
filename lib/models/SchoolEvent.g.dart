// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolEvent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolEvent _$SchoolEventFromJson(Map<String, dynamic> json) => SchoolEvent(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
  campusId: (json['campusId'] as num).toInt(),
  campus: json['campus'] == null
      ? null
      : Campus.fromJson(json['campus'] as Map<String, dynamic>),
  location: json['location'] as String?,
);

Map<String, dynamic> _$SchoolEventToJson(SchoolEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'campusId': instance.campusId,
      'campus': instance.campus,
      'location': instance.location,
    };
