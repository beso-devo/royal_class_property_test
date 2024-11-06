// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainPageState extends MainPageState {
  @override
  final int currentPageIndex;

  factory _$MainPageState([void Function(MainPageStateBuilder)? updates]) =>
      (new MainPageStateBuilder()..update(updates))._build();

  _$MainPageState._({required this.currentPageIndex}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currentPageIndex, r'MainPageState', 'currentPageIndex');
  }

  @override
  MainPageState rebuild(void Function(MainPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainPageStateBuilder toBuilder() => new MainPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainPageState && currentPageIndex == other.currentPageIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentPageIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainPageState')
          ..add('currentPageIndex', currentPageIndex))
        .toString();
  }
}

class MainPageStateBuilder
    implements Builder<MainPageState, MainPageStateBuilder> {
  _$MainPageState? _$v;

  int? _currentPageIndex;
  int? get currentPageIndex => _$this._currentPageIndex;
  set currentPageIndex(int? currentPageIndex) =>
      _$this._currentPageIndex = currentPageIndex;

  MainPageStateBuilder();

  MainPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPageIndex = $v.currentPageIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainPageState;
  }

  @override
  void update(void Function(MainPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainPageState build() => _build();

  _$MainPageState _build() {
    final _$result = _$v ??
        new _$MainPageState._(
            currentPageIndex: BuiltValueNullFieldError.checkNotNull(
                currentPageIndex, r'MainPageState', 'currentPageIndex'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
