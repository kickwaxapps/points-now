import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pointsnow/classes/utils.dart';
import 'package:pointsnow/widgets/racer-result.dart';
import '../classes/skier.dart';

import 'racer-result-model.dart';

// Include generated file
part 'race-model.g.dart';

class RaceModel = _RaceModel with _$RaceModel;

abstract class _RaceModel with Store {
  final List<int> defaultSkierIds;
  final List<String> defaultTimes;
  final String defaultDistanceFlag;
  final String defaultRaceName;


  @observable
  String raceName;

  @observable
  bool distance = true;


  _RaceModel(this.defaultSkierIds, this.defaultTimes, this.defaultDistanceFlag, this.defaultRaceName) {
    raceResults = [
      RacerResultModel(0, this),
      RacerResultModel(1, this),
      RacerResultModel(2, this),
      RacerResultModel(3, this),
      RacerResultModel(4, this),
    ];
    for ( var i = 0; i < defaultSkierIds.length; i++) {
      raceResults[i].selectedId = defaultSkierIds[i];
    }
    if(defaultTimes.length > 0 ) {
      firstTime = defaultTimes[0];
    }
    if(defaultTimes.length > 1 ) {
      secondTime = defaultTimes[1];
    }

    if (defaultDistanceFlag.isNotEmpty) {
      distance = defaultDistanceFlag == 'Y';
      step = 8;
    }

    if (defaultRaceName.isNotEmpty) {
      raceName = defaultRaceName;

    }

  }


  @observable
  String firstTime = '';
  @observable
  String secondTime = '';

  @observable
  String yourTime = '';

  @computed
  double get yourPoints {
    final t = parseTime(yourTime);

    if(t == 0) return 0;
    return (referenceTime/t) * referencePoints;
  }

  @observable
  int step = 0;


  @computed
  double get referencePoints {
    final sortedPoints = skiers.map((it)=>distance ? it.distancePoints : it.sprintPoints).where((it)=>it > 0).toList()..sort((a,b)=> -a.compareTo(b));
    if(sortedPoints.length < 2) return 0.0;
    final t0 = sortedPoints[0];
    final t1 = sortedPoints[1];
    return (t0+t1) / 2;
  }

  @computed
  List<Skier> get skiers {
    return raceResults.map((it)=>it.skier.value).where((it)=>it!=null).toList();

  }

  @computed
  double get referenceTime {
    final t0 = parseTime(firstTime);
    final t1 = parseTime(secondTime);
    return (t0+t1)/2;
  }


  @computed
  String get referenceTimeFmt {
    final s = referenceTime;
    return '${(s / 60).floor()}:${(s % 60).toStringAsFixed(1).padLeft(4, '0')}';
  }



  List<RacerResultModel> raceResults ;




}