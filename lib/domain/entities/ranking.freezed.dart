// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Ranking _$RankingFromJson(Map<String, dynamic> json) {
  return _Ranking.fromJson(json);
}

/// @nodoc
mixin _$Ranking {
  String get title => throw _privateConstructorUsedError;
  List<RankingItem> get items => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Ranking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingCopyWith<Ranking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingCopyWith<$Res> {
  factory $RankingCopyWith(Ranking value, $Res Function(Ranking) then) =
      _$RankingCopyWithImpl<$Res, Ranking>;
  @useResult
  $Res call({
    String title,
    List<RankingItem> items,
    String query,
    DateTime createdAt,
  });
}

/// @nodoc
class _$RankingCopyWithImpl<$Res, $Val extends Ranking>
    implements $RankingCopyWith<$Res> {
  _$RankingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? items = null,
    Object? query = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<RankingItem>,
            query:
                null == query
                    ? _value.query
                    : query // ignore: cast_nullable_to_non_nullable
                        as String,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RankingImplCopyWith<$Res> implements $RankingCopyWith<$Res> {
  factory _$$RankingImplCopyWith(
    _$RankingImpl value,
    $Res Function(_$RankingImpl) then,
  ) = __$$RankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    List<RankingItem> items,
    String query,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$RankingImplCopyWithImpl<$Res>
    extends _$RankingCopyWithImpl<$Res, _$RankingImpl>
    implements _$$RankingImplCopyWith<$Res> {
  __$$RankingImplCopyWithImpl(
    _$RankingImpl _value,
    $Res Function(_$RankingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? items = null,
    Object? query = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$RankingImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<RankingItem>,
        query:
            null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingImpl implements _Ranking {
  const _$RankingImpl({
    required this.title,
    required final List<RankingItem> items,
    required this.query,
    required this.createdAt,
  }) : _items = items;

  factory _$RankingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingImplFromJson(json);

  @override
  final String title;
  final List<RankingItem> _items;
  @override
  List<RankingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String query;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Ranking(title: $title, items: $items, query: $query, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    const DeepCollectionEquality().hash(_items),
    query,
    createdAt,
  );

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingImplCopyWith<_$RankingImpl> get copyWith =>
      __$$RankingImplCopyWithImpl<_$RankingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingImplToJson(this);
  }
}

abstract class _Ranking implements Ranking {
  const factory _Ranking({
    required final String title,
    required final List<RankingItem> items,
    required final String query,
    required final DateTime createdAt,
  }) = _$RankingImpl;

  factory _Ranking.fromJson(Map<String, dynamic> json) = _$RankingImpl.fromJson;

  @override
  String get title;
  @override
  List<RankingItem> get items;
  @override
  String get query;
  @override
  DateTime get createdAt;

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingImplCopyWith<_$RankingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
