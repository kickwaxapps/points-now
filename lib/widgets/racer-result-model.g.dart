// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'racer-result-model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RacerResultModel on _RacerResultModel, Store {
  Computed<ObservableFuture<Skier>> _$skierComputed;

  @override
  ObservableFuture<Skier> get skier =>
      (_$skierComputed ??= Computed<ObservableFuture<Skier>>(() => super.skier))
          .value;
  Computed<double> _$timeComputed;

  @override
  double get time =>
      (_$timeComputed ??= Computed<double>(() => super.time)).value;
  Computed<ObservableFuture<List<Skier>>> _$matchingSkiersComputed;

  @override
  ObservableFuture<List<Skier>> get matchingSkiers =>
      (_$matchingSkiersComputed ??= Computed<ObservableFuture<List<Skier>>>(
              () => super.matchingSkiers))
          .value;

  final _$searchTokenAtom = Atom(name: '_RacerResultModel.searchToken');

  @override
  String get searchToken {
    _$searchTokenAtom.context.enforceReadPolicy(_$searchTokenAtom);
    _$searchTokenAtom.reportObserved();
    return super.searchToken;
  }

  @override
  set searchToken(String value) {
    _$searchTokenAtom.context.conditionallyRunInAction(() {
      super.searchToken = value;
      _$searchTokenAtom.reportChanged();
    }, _$searchTokenAtom, name: '${_$searchTokenAtom.name}_set');
  }

  final _$selectedIdAtom = Atom(name: '_RacerResultModel.selectedId');

  @override
  int get selectedId {
    _$selectedIdAtom.context.enforceReadPolicy(_$selectedIdAtom);
    _$selectedIdAtom.reportObserved();
    return super.selectedId;
  }

  @override
  set selectedId(int value) {
    _$selectedIdAtom.context.conditionallyRunInAction(() {
      super.selectedId = value;
      _$selectedIdAtom.reportChanged();
    }, _$selectedIdAtom, name: '${_$selectedIdAtom.name}_set');
  }

  final _$inputTimeAtom = Atom(name: '_RacerResultModel.inputTime');

  @override
  String get inputTime {
    _$inputTimeAtom.context.enforceReadPolicy(_$inputTimeAtom);
    _$inputTimeAtom.reportObserved();
    return super.inputTime;
  }

  @override
  set inputTime(String value) {
    _$inputTimeAtom.context.conditionallyRunInAction(() {
      super.inputTime = value;
      _$inputTimeAtom.reportChanged();
    }, _$inputTimeAtom, name: '${_$inputTimeAtom.name}_set');
  }
}
