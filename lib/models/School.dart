import 'package:json_annotation/json_annotation.dart';
import 'Campus.dart';
import 'Announcement.dart';
import 'SchoolEvent.dart';
import 'SchoolNews.dart';

part 'School.g.dart';

@JsonSerializable()
class School {
  int id;
  String Name;
  List<Campus> Campuses;
  String Email;
  String Website;
  String PhoneNumber;
  List<Announcement> SchoolAnnouncements;
  List<SchoolEvent> SchoolEvents;
  List<SchoolNews> schoolNews;

  School({
    required this.id,
    required this.Name,
    this.Email = '',
    this.Website = '',
    this.PhoneNumber = '',
    List<Campus>? Campuses,
    List<Announcement>? SchoolAnnouncements,
    List<SchoolEvent>? schoolEvents,
    List<SchoolNews>? schoolNews,
  })  : this.Campuses = Campuses ?? [],
        this.SchoolAnnouncements = SchoolAnnouncements ?? [],
        this.SchoolEvents = schoolEvents ?? [],
        this.schoolNews = schoolNews ?? [];

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
