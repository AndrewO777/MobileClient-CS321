import 'package:json_annotation/json_annotation.dart';
import 'CafeteriaItem.dart';

part 'CafeteriaMenu.g.dart';

@JsonSerializable(explicitToJson: true)
class CafeteriaMenu {
  int id;
  @JsonKey(defaultValue: [])
  List<CafeteriaItem> menuItems;
  bool? isDeleted;
  int? timestamp;

  CafeteriaMenu({
    required this.id,
    List<CafeteriaItem>? menuItems,
    this.isDeleted,
    this.timestamp,
  }) : menuItems = menuItems ?? [];

  factory CafeteriaMenu.fromJson(Map<String, dynamic> json) =>
      _$CafeteriaMenuFromJson(json);

  Map<String, dynamic> toJson() => _$CafeteriaMenuToJson(this);
}