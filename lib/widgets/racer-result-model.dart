

import 'package:mobx/mobx.dart';
import 'package:pointsnow/classes/utils.dart';
import 'package:pointsnow/widgets/race-model.dart';

import '../classes/skier.dart';

// Include generated file
part 'racer-result-model.g.dart';

class RacerResultModel = _RacerResultModel with _$RacerResultModel;

abstract class _RacerResultModel with Store {

  _RacerResultModel(this.rank, this.race);

  final int rank;
  final RaceModel race;

  @observable
  String searchToken = '';

  @observable
  int selectedId = -1;

  @observable
  String inputTime = '';

  @computed
  ObservableFuture<Skier> get skier {
    return ObservableFuture(Skier.fetch(selectedId));
  }

  @computed
  double get time => parseTime(inputTime);

  @computed
  ObservableFuture<List<Skier>> get matchingSkiers  {
    return ObservableFuture(Skier.skiersLike(searchToken));
  }

}