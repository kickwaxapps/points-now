// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race-model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RaceModel on _RaceModel, Store {
  Computed<double> _$yourPointsComputed;

  @override
  double get yourPoints =>
      (_$yourPointsComputed ??= Computed<double>(() => super.yourPoints)).value;
  Computed<double> _$referencePointsComputed;

  @override
  double get referencePoints => (_$referencePointsComputed ??=
          Computed<double>(() => super.referencePoints))
      .value;
  Computed<List<Skier>> _$skiersComputed;

  @override
  List<Skier> get skiers =>
      (_$skiersComputed ??= Computed<List<Skier>>(() => super.skiers)).value;
  Computed<double> _$referenceTimeComputed;

  @override
  double get referenceTime =>
      (_$referenceTimeComputed ??= Computed<double>(() => super.referenceTime))
          .value;
  Computed<String> _$referenceTimeFmtComputed;

  @override
  String get referenceTimeFmt => (_$referenceTimeFmtComputed ??=
          Computed<String>(() => super.referenceTimeFmt))
      .value;

  final _$raceNameAtom = Atom(name: '_RaceModel.raceName');

  @override
  String get raceName {
    _$raceNameAtom.context.enforceReadPolicy(_$raceNameAtom);
    _$raceNameAtom.reportObserved();
    return super.raceName;
  }

  @override
  set raceName(String value) {
    _$raceNameAtom.context.conditionallyRunInAction(() {
      super.raceName = value;
      _$raceNameAtom.reportChanged();
    }, _$raceNameAtom, name: '${_$raceNameAtom.name}_set');
  }

  final _$distanceAtom = Atom(name: '_RaceModel.distance');

  @override
  bool get distance {
    _$distanceAtom.context.enforceReadPolicy(_$distanceAtom);
    _$distanceAtom.reportObserved();
    return super.distance;
  }

  @override
  set distance(bool value) {
    _$distanceAtom.context.conditionallyRunInAction(() {
      super.distance = value;
      _$distanceAtom.reportChanged();
    }, _$distanceAtom, name: '${_$distanceAtom.name}_set');
  }

  final _$firstTimeAtom = Atom(name: '_RaceModel.firstTime');

  @override
  String get firstTime {
    _$firstTimeAtom.context.enforceReadPolicy(_$firstTimeAtom);
    _$firstTimeAtom.reportObserved();
    return super.firstTime;
  }

  @override
  set firstTime(String value) {
    _$firstTimeAtom.context.conditionallyRunInAction(() {
      super.firstTime = value;
      _$firstTimeAtom.reportChanged();
    }, _$firstTimeAtom, name: '${_$firstTimeAtom.name}_set');
  }

  final _$secondTimeAtom = Atom(name: '_RaceModel.secondTime');

  @override
  String get secondTime {
    _$secondTimeAtom.context.enforceReadPolicy(_$secondTimeAtom);
    _$secondTimeAtom.reportObserved();
    return super.secondTime;
  }

  @override
  set secondTime(String value) {
    _$secondTimeAtom.context.conditionallyRunInAction(() {
      super.secondTime = value;
      _$secondTimeAtom.reportChanged();
    }, _$secondTimeAtom, name: '${_$secondTimeAtom.name}_set');
  }

  final _$yourTimeAtom = Atom(name: '_RaceModel.yourTime');

  @override
  String get yourTime {
    _$yourTimeAtom.context.enforceReadPolicy(_$yourTimeAtom);
    _$yourTimeAtom.reportObserved();
    return super.yourTime;
  }

  @override
  set yourTime(String value) {
    _$yourTimeAtom.context.conditionallyRunInAction(() {
      super.yourTime = value;
      _$yourTimeAtom.reportChanged();
    }, _$yourTimeAtom, name: '${_$yourTimeAtom.name}_set');
  }

  final _$stepAtom = Atom(name: '_RaceModel.step');

  @override
  int get step {
    _$stepAtom.context.enforceReadPolicy(_$stepAtom);
    _$stepAtom.reportObserved();
    return super.step;
  }

  @override
  set step(int value) {
    _$stepAtom.context.conditionallyRunInAction(() {
      super.step = value;
      _$stepAtom.reportChanged();
    }, _$stepAtom, name: '${_$stepAtom.name}_set');
  }
}
