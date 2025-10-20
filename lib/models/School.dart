import 'package:json_annotation/json_annotation.dart';

part 'School.g.dart';

@JsonSerializable()
class School {
  int id;
  String name;
  String email;
  String website;
  String phoneNumber;

  School({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
    required this.phoneNumber,
});

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}