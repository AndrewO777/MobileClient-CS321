import 'package:json_annotation/json_annotation.dart';
import 'Campus.dart';

part 'SchoolEvent.g.dart';

@JsonSerializable()
class SchoolEvent {
  int id;String? title;
  String? description;
  DateTime start;
  DateTime end;
  int campusId;
  Campus? campus;
  String? location;

  SchoolEvent({
    required this.id,
    this.title,
    this.description,
    required this.start,
    required this.end,
    required this.campusId,
    this.campus,
    this.location,
  });

  factory SchoolEvent.fromJson(Map<String, dynamic> json) => _$SchoolEventFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolEventToJson(this);
}
