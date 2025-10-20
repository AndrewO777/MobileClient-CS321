import 'package:json_annotation/json_annotation.dart';
import 'School.dart';
import 'Address.dart';

part 'Campus.g.dart';

@JsonSerializable()
class Campus{
  int id;
  String? name;
  int addressId;
  Address? address;
  int schoolId;
  School? school;

  Campus({
    required this.id,
    this.name,
    required this.addressId,
    this.address,
    required this.schoolId,
    this.school,
  });

  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);
  Map<String, dynamic> toJson() => _$CampusToJson(this);
}
