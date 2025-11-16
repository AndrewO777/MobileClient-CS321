import 'package:json_annotation/json_annotation.dart';

part 'CafeteriaItem.g.dart';

enum MenuCategory {
  @JsonValue(0)
  side,
  @JsonValue(1)
  drink,
  @JsonValue(2)
  appetizer,
}

@JsonSerializable()
class CafeteriaItem {
  int id;
  MenuCategory category;
  String name;
  String description;
  String iconName;
  bool? isDeleted;
  int? timestamp;

  CafeteriaItem({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.iconName,
    this.isDeleted,
    this.timestamp,
  });

  factory CafeteriaItem.fromJson(Map<String, dynamic> json) =>
      _$CafeteriaItemFromJson(json);

  Map<String, dynamic> toJson() => _$CafeteriaItemToJson(this);
}