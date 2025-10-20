import 'package:json_annotation/json_annotation.dart';

part 'Event.g.dart';

@JsonSerializable()
class Event {
  int id;
  String title;
  String description;
  DateTime start;
  DateTime end;
  int campusId;
  String location;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.start,
    required this.end,
    required this.campusId,
    required this.location,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}