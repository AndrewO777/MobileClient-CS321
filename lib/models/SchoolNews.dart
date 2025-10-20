import 'package:json_annotation/json_annotation.dart';
import 'School.dart';

part 'SchoolNews.g.dart';

@JsonSerializable()
class SchoolNews {
  int id;
  String? headline;
  String? content;
  DateTime datePublished;
  String? author;
  int schoolId;
  School? school;

  SchoolNews({
    required this.id,
    this.headline,
    this.content,
    required this.datePublished,
    this.author,
    required this.schoolId,
    this.school,
  });

  factory SchoolNews.fromJson(Map<String, dynamic> json) => _$SchoolNewsFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolNewsToJson(this);
}
