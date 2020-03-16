// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$tickerBitcoinAtom = Atom(name: '_HomeControllerBase.tickerBitcoin');

  @override
  ObservableFuture<TickerBitcoin> get tickerBitcoin {
    _$tickerBitcoinAtom.context.enforceReadPolicy(_$tickerBitcoinAtom);
    _$tickerBitcoinAtom.reportObserved();
    return super.tickerBitcoin;
  }

  @override
  set tickerBitcoin(ObservableFuture<TickerBitcoin> value) {
    _$tickerBitcoinAtom.context.conditionallyRunInAction(() {
      super.tickerBitcoin = value;
      _$tickerBitcoinAtom.reportChanged();
    }, _$tickerBitcoinAtom, name: '${_$tickerBitcoinAtom.name}_set');
  }

  final _$brlValueAtom = Atom(name: '_HomeControllerBase.brlValue');

  @override
  TextValue get brlValue {
    _$brlValueAtom.context.enforceReadPolicy(_$brlValueAtom);
    _$brlValueAtom.reportObserved();
    return super.brlValue;
  }

  @override
  set brlValue(TextValue value) {
    _$brlValueAtom.context.conditionallyRunInAction(() {
      super.brlValue = value;
      _$brlValueAtom.reportChanged();
    }, _$brlValueAtom, name: '${_$brlValueAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeBrlValue() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeBrlValue();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetOldValue() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.resetOldValue();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchBitCoinValue() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.fetchBitCoinValue();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'tickerBitcoin: ${tickerBitcoin.toString()},brlValue: ${brlValue.toString()}';
    return '{$string}';
  }
}
