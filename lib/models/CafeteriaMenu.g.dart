// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CafeteriaMenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeteriaMenu _$CafeteriaMenuFromJson(Map<String, dynamic> json) =>
    CafeteriaMenu(
      id: (json['id'] as num).toInt(),
      menuItems: (json['menuItems'] as List<dynamic>?)
              ?.map((e) => CafeteriaItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isDeleted: json['isDeleted'] as bool?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CafeteriaMenuToJson(CafeteriaMenu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menuItems': instance.menuItems.map((e) => e.toJson()).toList(),
      'isDeleted': instance.isDeleted,
      'timestamp': instance.timestamp,
    };
