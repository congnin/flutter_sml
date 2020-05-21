// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'operation_non_nested.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$OperationNonNestedTearOff {
  const _$OperationNonNestedTearOff();

  Add add(int value) {
    return Add(
      value,
    );
  }

  Subtract subtract(int value) {
    return Subtract(
      value,
    );
  }
}

// ignore: unused_element
const $OperationNonNested = _$OperationNonNestedTearOff();

mixin _$OperationNonNested {
  int get value;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(int value),
    @required Result subtract(int value),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(int value),
    Result subtract(int value),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(Add value),
    @required Result subtract(Subtract value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(Add value),
    Result subtract(Subtract value),
    @required Result orElse(),
  });

  $OperationNonNestedCopyWith<OperationNonNested> get copyWith;
}

abstract class $OperationNonNestedCopyWith<$Res> {
  factory $OperationNonNestedCopyWith(
          OperationNonNested value, $Res Function(OperationNonNested) then) =
      _$OperationNonNestedCopyWithImpl<$Res>;
  $Res call({int value});
}

class _$OperationNonNestedCopyWithImpl<$Res>
    implements $OperationNonNestedCopyWith<$Res> {
  _$OperationNonNestedCopyWithImpl(this._value, this._then);

  final OperationNonNested _value;
  // ignore: unused_field
  final $Res Function(OperationNonNested) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as int,
    ));
  }
}

abstract class $AddCopyWith<$Res> implements $OperationNonNestedCopyWith<$Res> {
  factory $AddCopyWith(Add value, $Res Function(Add) then) =
      _$AddCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

class _$AddCopyWithImpl<$Res> extends _$OperationNonNestedCopyWithImpl<$Res>
    implements $AddCopyWith<$Res> {
  _$AddCopyWithImpl(Add _value, $Res Function(Add) _then)
      : super(_value, (v) => _then(v as Add));

  @override
  Add get _value => super._value as Add;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Add(
      value == freezed ? _value.value : value as int,
    ));
  }
}

class _$Add implements Add {
  const _$Add(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'OperationNonNested.add(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Add &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $AddCopyWith<Add> get copyWith => _$AddCopyWithImpl<Add>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(int value),
    @required Result subtract(int value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return add(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(int value),
    Result subtract(int value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(Add value),
    @required Result subtract(Subtract value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return add(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(Add value),
    Result subtract(Subtract value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add implements OperationNonNested {
  const factory Add(int value) = _$Add;

  @override
  int get value;
  @override
  $AddCopyWith<Add> get copyWith;
}

abstract class $SubtractCopyWith<$Res>
    implements $OperationNonNestedCopyWith<$Res> {
  factory $SubtractCopyWith(Subtract value, $Res Function(Subtract) then) =
      _$SubtractCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

class _$SubtractCopyWithImpl<$Res>
    extends _$OperationNonNestedCopyWithImpl<$Res>
    implements $SubtractCopyWith<$Res> {
  _$SubtractCopyWithImpl(Subtract _value, $Res Function(Subtract) _then)
      : super(_value, (v) => _then(v as Subtract));

  @override
  Subtract get _value => super._value as Subtract;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Subtract(
      value == freezed ? _value.value : value as int,
    ));
  }
}

class _$Subtract implements Subtract {
  const _$Subtract(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'OperationNonNested.subtract(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Subtract &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $SubtractCopyWith<Subtract> get copyWith =>
      _$SubtractCopyWithImpl<Subtract>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(int value),
    @required Result subtract(int value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return subtract(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(int value),
    Result subtract(int value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subtract != null) {
      return subtract(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(Add value),
    @required Result subtract(Subtract value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return subtract(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(Add value),
    Result subtract(Subtract value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subtract != null) {
      return subtract(this);
    }
    return orElse();
  }
}

abstract class Subtract implements OperationNonNested {
  const factory Subtract(int value) = _$Subtract;

  @override
  int get value;
  @override
  $SubtractCopyWith<Subtract> get copyWith;
}
