// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemModel _$$_ItemModelFromJson(Map<String, dynamic> json) => _$_ItemModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      obtained: json['obtained'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ItemModelToJson(_$_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'obtained': instance.obtained,
    };
