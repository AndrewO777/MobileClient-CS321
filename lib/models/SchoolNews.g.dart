// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolNews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolNews _$SchoolNewsFromJson(Map<String, dynamic> json) => SchoolNews(
      id: (json['id'] as num).toInt(),
      headline: json['headline'] as String,
      content: json['content'] as String,
      datePublished: DateTime.parse(json['datePublished'] as String),
      author: json['author'] as String,
      schoolId: (json['schoolId'] as num).toInt(),
      school: School.fromJson(json['school'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchoolNewsToJson(SchoolNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'content': instance.content,
      'datePublished': instance.datePublished.toIso8601String(),
      'author': instance.author,
      'schoolId': instance.schoolId,
      'school': instance.school,
    };
