// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CafeteriaItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeteriaItem _$CafeteriaItemFromJson(Map<String, dynamic> json) =>
    CafeteriaItem(
      id: (json['id'] as num).toInt(),
      category: $enumDecode(_$MenuCategoryEnumMap, json['category']),
      name: json['name'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      isDeleted: json['isDeleted'] as bool?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CafeteriaItemToJson(CafeteriaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': _$MenuCategoryEnumMap[instance.category]!,
      'name': instance.name,
      'description': instance.description,
      'iconName': instance.iconName,
      'isDeleted': instance.isDeleted,
      'timestamp': instance.timestamp,
    };

const _$MenuCategoryEnumMap = {
  MenuCategory.side: 0,
  MenuCategory.drink: 1,
  MenuCategory.appetizer: 2,
};
