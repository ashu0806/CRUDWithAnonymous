// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get obtained => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({String? id, String name, bool obtained});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? obtained = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      obtained: obtained == freezed
          ? _value.obtained
          : obtained // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemModelCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemModelCopyWith(
          _$_ItemModel value, $Res Function(_$_ItemModel) then) =
      __$$_ItemModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name, bool obtained});
}

/// @nodoc
class __$$_ItemModelCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemModelCopyWith<$Res> {
  __$$_ItemModelCopyWithImpl(
      _$_ItemModel _value, $Res Function(_$_ItemModel) _then)
      : super(_value, (v) => _then(v as _$_ItemModel));

  @override
  _$_ItemModel get _value => super._value as _$_ItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? obtained = freezed,
  }) {
    return _then(_$_ItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      obtained: obtained == freezed
          ? _value.obtained
          : obtained // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemModel extends _ItemModel {
  const _$_ItemModel({this.id, required this.name, this.obtained = false})
      : super._();

  factory _$_ItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ItemModelFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool obtained;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, obtained: $obtained)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.obtained, obtained));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(obtained));

  @JsonKey(ignore: true)
  @override
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      __$$_ItemModelCopyWithImpl<_$_ItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemModelToJson(
      this,
    );
  }
}

abstract class _ItemModel extends Item {
  const factory _ItemModel(
      {final String? id,
      required final String name,
      final bool obtained}) = _$_ItemModel;
  const _ItemModel._() : super._();

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$_ItemModel.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  bool get obtained;
  @override
  @JsonKey(ignore: true)
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
