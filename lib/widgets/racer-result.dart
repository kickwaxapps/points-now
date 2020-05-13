


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pointsnow/classes/skier.dart';
import 'package:provider/provider.dart';

import 'racer-result-model.dart';

class RacerResult extends StatelessWidget {

  RacerResult({this.model}):super(key:ValueKey(model.race.step));

  final RacerResultModel model;

  @override
  Widget build(BuildContext context) {
    return Provider.value(value: model, child: InnerRaceResult() );
  }

}

class InnerRaceResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RacerResultModel>(context);
    final textPlace = ['First', 'Second', 'Third', 'Forth', 'Fifth'];


    return Column(children: [
    Padding( child: Text('Enter ${textPlace[model.race.step-1]} Place Skier', style: TextStyle(fontSize: 20),), padding: EdgeInsets.all(10)),
     Observer(builder: (_) {
      final skierFuture = model.skier;
      final hasSelected = model.selectedId != -1;
      if (hasSelected) {
        final skier = skierFuture.value;
        final id = skier?.id ?? -1;
        return ListTile(title: Text(skier?.name ?? 'Fetching...'),
            subtitle: skier != null
                ? Text('Id: ${skier.id} Dist: ${skier.distancePoints} Sprint: ${skier.sprintPoints}')
                : Text(''));
      } else {
        return ListTile(
            title: Text('Enter a name below and select a skier.'),
            subtitle: Text('')
        );
      }
    }),
      Padding(
          padding: EdgeInsets.all(10),
          child: Observer( builder: (context) => TextFormField(
            initialValue: model.searchToken,
            decoration: InputDecoration(helperText: 'Nom/Name', hintText: 'Alex Harvey, par example', suffixIcon:  IconButton(icon: Icon(Icons.clear), onPressed: () {model.searchToken = '';model.selectedId = -1;},)),
            keyboardType: TextInputType.text,
            onChanged: (v) {
              model.searchToken = v;
            },
          ))),
    SelectableSkiers()
    ]);
  }

}


class SelectableSkiers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RacerResultModel>(context);

    return Observer(
        builder: (context) {
    return FutureBuilder(
        future:  model.matchingSkiers,
        builder: (context, snp) {
          if (snp.hasError) return Text(snp.error.toString());
          if (!snp.hasData) return CircularProgressIndicator();
          return body(context, snp.data);
        });

    });
  }

  Widget body(BuildContext context, List<Skier> matches) {
    final model = Provider.of<RacerResultModel>(context);

    return Observer(
      builder: (context) {
        if (matches.length == 0) return Text('No matches');
        return Expanded(child:Scrollbar(child:ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, i) {
          final skier = matches[i];
          return ListTile(
              title: Text(skier.name),
              onTap: () {
                model.selectedId = skier.id;
              },
              selected: model.selectedId == skier.id);
        })));
      },
    );

  }
}