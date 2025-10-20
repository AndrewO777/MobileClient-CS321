import 'package:json_annotation/json_annotation.dart';
import 'School.dart';
import 'Address.dart';

part 'Campus.g.dart';

@JsonSerializable()
class Campus{
  int id;
  String Name;
  int AddressId;
  Address address;
  int SchoolId;
  School school;

  Campus({
    required this.id,
    required this.Name,
    required this.AddressId,
    required this.address,
    required this.SchoolId,
    required this.school,
  });

  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);
  Map<String, dynamic> toJson() => _$CampusToJson(this);
}
