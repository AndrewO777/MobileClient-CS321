import 'package:json_annotation/json_annotation.dart';
import 'School.dart';
import 'Address.dart';

part 'Campus.g.dart';

@JsonSerializable(explicitToJson: true)
class Campus {
  int id;
  String? name;
  int addressId;
  Address? address;
  int schoolId;

  // Ignore school to avoid circular reference (Campus -> School -> campuses -> Campus)
  @JsonKey(ignore: true)
  School? school;

  Campus({
    required this.id,
    this.name,
    required this.addressId,
    this.address,
    required this.schoolId,
    this.school,
  });

  factory Campus.fromJson(Map<String, dynamic> json) {
    // Remove school from json to avoid circular reference
    final jsonCopy = Map<String, dynamic>.from(json);
    jsonCopy.remove('school');
    return _$CampusFromJson(jsonCopy);
  }

  Map<String, dynamic> toJson() => _$CampusToJson(this);
}