// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RankingItem _$RankingItemFromJson(Map<String, dynamic> json) {
  return _RankingItem.fromJson(json);
}

/// @nodoc
mixin _$RankingItem {
  int get rank => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get imageSearchTerm => throw _privateConstructorUsedError;

  /// Serializes this RankingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingItemCopyWith<RankingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingItemCopyWith<$Res> {
  factory $RankingItemCopyWith(
    RankingItem value,
    $Res Function(RankingItem) then,
  ) = _$RankingItemCopyWithImpl<$Res, RankingItem>;
  @useResult
  $Res call({
    int rank,
    String name,
    String subtitle,
    String description,
    double rating,
    String? imageUrl,
    String imageSearchTerm,
  });
}

/// @nodoc
class _$RankingItemCopyWithImpl<$Res, $Val extends RankingItem>
    implements $RankingItemCopyWith<$Res> {
  _$RankingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? name = null,
    Object? subtitle = null,
    Object? description = null,
    Object? rating = null,
    Object? imageUrl = freezed,
    Object? imageSearchTerm = null,
  }) {
    return _then(
      _value.copyWith(
            rank:
                null == rank
                    ? _value.rank
                    : rank // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            subtitle:
                null == subtitle
                    ? _value.subtitle
                    : subtitle // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageSearchTerm:
                null == imageSearchTerm
                    ? _value.imageSearchTerm
                    : imageSearchTerm // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RankingItemImplCopyWith<$Res>
    implements $RankingItemCopyWith<$Res> {
  factory _$$RankingItemImplCopyWith(
    _$RankingItemImpl value,
    $Res Function(_$RankingItemImpl) then,
  ) = __$$RankingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int rank,
    String name,
    String subtitle,
    String description,
    double rating,
    String? imageUrl,
    String imageSearchTerm,
  });
}

/// @nodoc
class __$$RankingItemImplCopyWithImpl<$Res>
    extends _$RankingItemCopyWithImpl<$Res, _$RankingItemImpl>
    implements _$$RankingItemImplCopyWith<$Res> {
  __$$RankingItemImplCopyWithImpl(
    _$RankingItemImpl _value,
    $Res Function(_$RankingItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? name = null,
    Object? subtitle = null,
    Object? description = null,
    Object? rating = null,
    Object? imageUrl = freezed,
    Object? imageSearchTerm = null,
  }) {
    return _then(
      _$RankingItemImpl(
        rank:
            null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        subtitle:
            null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageSearchTerm:
            null == imageSearchTerm
                ? _value.imageSearchTerm
                : imageSearchTerm // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingItemImpl implements _RankingItem {
  const _$RankingItemImpl({
    required this.rank,
    required this.name,
    required this.subtitle,
    required this.description,
    this.rating = 0.0,
    this.imageUrl,
    required this.imageSearchTerm,
  });

  factory _$RankingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingItemImplFromJson(json);

  @override
  final int rank;
  @override
  final String name;
  @override
  final String subtitle;
  @override
  final String description;
  @override
  @JsonKey()
  final double rating;
  @override
  final String? imageUrl;
  @override
  final String imageSearchTerm;

  @override
  String toString() {
    return 'RankingItem(rank: $rank, name: $name, subtitle: $subtitle, description: $description, rating: $rating, imageUrl: $imageUrl, imageSearchTerm: $imageSearchTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingItemImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageSearchTerm, imageSearchTerm) ||
                other.imageSearchTerm == imageSearchTerm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    rank,
    name,
    subtitle,
    description,
    rating,
    imageUrl,
    imageSearchTerm,
  );

  /// Create a copy of RankingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingItemImplCopyWith<_$RankingItemImpl> get copyWith =>
      __$$RankingItemImplCopyWithImpl<_$RankingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingItemImplToJson(this);
  }
}

abstract class _RankingItem implements RankingItem {
  const factory _RankingItem({
    required final int rank,
    required final String name,
    required final String subtitle,
    required final String description,
    final double rating,
    final String? imageUrl,
    required final String imageSearchTerm,
  }) = _$RankingItemImpl;

  factory _RankingItem.fromJson(Map<String, dynamic> json) =
      _$RankingItemImpl.fromJson;

  @override
  int get rank;
  @override
  String get name;
  @override
  String get subtitle;
  @override
  String get description;
  @override
  double get rating;
  @override
  String? get imageUrl;
  @override
  String get imageSearchTerm;

  /// Create a copy of RankingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingItemImplCopyWith<_$RankingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
