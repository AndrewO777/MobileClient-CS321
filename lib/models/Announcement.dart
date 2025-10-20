import 'package:json_annotation/json_annotation.dart';

part 'Announcement.g.dart';

@JsonSerializable()
class Announcement {
  int id;
  String title;
  String message;
  DateTime datePosted;
  int schoolId;

  Announcement({
    required this.id,
    required this.title,
    required this.message,
    required this.datePosted,
    required this.schoolId,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => _$AnnouncementFromJson(json);
  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}