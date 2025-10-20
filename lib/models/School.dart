import 'package:json_annotation/json_annotation.dart';
import 'Campus.dart';
import 'Announcement.dart';
import 'SchoolEvent.dart';
import 'SchoolNews.dart';

part 'School.g.dart';

@JsonSerializable()
class School {
  int id;
  String? name;
  @JsonKey(defaultValue: [])
  List<Campus> campuses;
  String email;
  String website;
  String phoneNumber;
  @JsonKey(defaultValue: [])
  List<Announcement> schoolAnnouncements;
  @JsonKey(defaultValue: [])
  List<SchoolEvent> schoolEvents;
  @JsonKey(defaultValue: [])
  List<SchoolNews> schoolNews;

  School({
    required this.id,
    this.name,
    this.email = '',
    this.website = '',
    this.phoneNumber = '',
    List<Campus>? campuses,
    List<Announcement>? schoolAnnouncements,
    List<SchoolEvent>? schoolEvents,
    List<SchoolNews>? schoolNews,
  })  : this.campuses = campuses ?? [],
        this.schoolAnnouncements = schoolAnnouncements ?? [],
        this.schoolEvents = schoolEvents ?? [],
        this.schoolNews = schoolNews ?? [];

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
