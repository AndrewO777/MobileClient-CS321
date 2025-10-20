// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: (json['id'] as num).toInt(),
      headline: json['headline'] as String,
      content: json['content'] as String,
      datePublished: DateTime.parse(json['datePublished'] as String),
      author: json['author'] as String,
      schoolId: (json['schoolId'] as num).toInt(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'content': instance.content,
      'datePublished': instance.datePublished.toIso8601String(),
      'author': instance.author,
      'schoolId': instance.schoolId,
    };
