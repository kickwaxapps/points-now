import 'dart:html';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:clippy/browser.dart' as clippy;
import 'package:mobx/mobx.dart';
import 'package:pointsnow/widgets/race-model.dart';
import 'package:pointsnow/widgets/racer-result-model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'package:flutter/material.dart';

import 'racer-result.dart';


class Race extends StatelessWidget {

  final RaceModel model;

  const Race({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(value: model, child: WillPopScope( onWillPop: () { model.step--; return Future.value(false);}, child: InnerRace() ));
  }
}

class InnerRace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RaceModel>(context);
    return Form(
        onChanged: () {},
        child:   Observer(builder: (context)=>Column (
        children: [

          Expanded(
              child:Observer(builder: (_)=>AnimatedSwitcher(
            duration: Duration(milliseconds: 1500),
            child:WidgetForStep(ValueKey(model.step)),
          /*  transitionBuilder: (child, anim) =>
                SlideTransition(
                    child: child,
                    position:  Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1, 0.0)).animate(anim)) */
          ))),

          Container(
            color: Colors.blueGrey,
              child:Row(

            children: <Widget>[
              model.step == 0 ? Spacer() : FlatButton( child: Text('Back', style: TextStyle(fontSize: 20)), onPressed: () { model.step--;}),
              Spacer(),
              Text('${model.step+1}/9'),
              Spacer(),
              model.step == 8 ? IconButton(icon: Icon(Icons.share), onPressed: ()=> share(context),) : FlatButton( child: Text('Next', style: TextStyle(fontSize: 20)), onPressed: () { model.step++;})

            ],
          ))

        ]
      ))
    );
  }


  Future<void> share(context) async {
    final model = Provider.of<RaceModel>(context);

    final url = Uri.encodeFull(
        'yourpoints.surge.sh/#/?name=${model.raceName}&distance=${model.distance?'Y':'N'}&skiers=${model.raceResults.map((it) => it.selectedId).join(',')}&times=${model
            .firstTime},${model.secondTime}');
    await clippy.write(url);


    // Find the Scaffold in the widget tree and use it to show a SnackBar.
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Shareable link was copied to the clipboard.'),
    ));
  }
}


class WidgetForStep extends StatelessWidget {
  WidgetForStep(key): super(key:key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RaceModel>(context);

    return Observer(builder: (context) {
      if (model.step == 0) {
        return Column(
            children: [
              Padding( child: Text('Select the Race Type', style: TextStyle(fontSize: 20),), padding: EdgeInsets.all(10),),
              ListTile(title: Text('Distance'), trailing: Observer(builder: (_)=>Icon(model.distance ? Icons.check_circle : Icons.radio_button_unchecked)), onTap: (){
                model.distance = true;
              }),
              ListTile(title: Text('Sprint'), trailing: Observer(builder: (_)=>Icon(!model.distance ? Icons.check_circle : Icons.radio_button_unchecked)), onTap: (){
                model.distance = false;
              }),
            ]);
      }
      else if (model.step >= 1 && model.step <=5 ) {
        final index = model.step - 1;
        return RacerResult(model: model.raceResults[index]);
      }
      else if( model.step == 6 || model.step == 7)
        return
          Column(

            children: [
              Padding( child: Text(model.step == 6 ? 'Enter Winning Time' : 'Enter Second Place Time', style: TextStyle(fontSize: 20),), padding: EdgeInsets.all(10),),
              Padding(
                padding: EdgeInsets.all(10),
                  child:TextFormField(
              enableInteractiveSelection: true,
              initialValue: model.step == 6 ? model.firstTime : model.secondTime,
              decoration: InputDecoration(
                  helperText: model.step == 6 ? 'Winner\'s time' : 'Second place time', hintText: 'hh:mm:ss.ss',
                  suffixIcon:  IconButton(icon: Icon(Icons.clear), onPressed: () {
                    if(model.step == 6) {
                      model.firstTime = '';
                    } else {
                      model.secondTime = '';
                    }
                  },)
              ),
              keyboardType: TextInputType.text,
              onChanged: (v) {
                if(model.step == 6) {
                  model.firstTime = v;
                } else {
                  model.secondTime = v;
                }
              },
            ))]);
      else if (model.step == 8) {
        return RacePoints();
      }
      else {
        return Container();
      }
    });
  }
}


class RacePoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RaceModel>(context);

    return Observer(builder: (context) {
      return ListView(

          children: [
          ...[
            Padding( child: Text('Enter Your Time' , style: TextStyle(fontSize: 20),), padding: EdgeInsets.all(10),),
            Padding(
                padding: EdgeInsets.all(10),
                child:TextFormField(
                  enableInteractiveSelection: true,
                  initialValue: model.yourTime,
                  decoration: InputDecoration(
                      helperText: 'Your time:', hintText: 'hh:mm:ss.ss',
                      suffixIcon:  IconButton(icon: Icon(Icons.clear), onPressed: () {model.yourTime = '';},)
                  ),

                  keyboardType: TextInputType.text,
                  onChanged: (v) {
                      model.yourTime = v;
                  },
                ))
          ],
          ...[
            ListTile(title: Observer(builder: (context) =>Text('Reference Time: ${model.referenceTimeFmt}'))),
            ListTile( title:  Text('Reference Points: ${model.referencePoints.toStringAsFixed(4)}')),
            ListTile( title:  Text('Your Points: ${model.yourPoints.toStringAsFixed(4)}'))
          ],
          ExpansionTile(
            title: Text('Show Details'),
            initiallyExpanded: false,

            children:
              [
                ListTile(dense: true, title: Text('Winning time: ${model.firstTime}')),
                ListTile(dense: true, title: Text('Second place time: ${model.secondTime}')),
                ...model.skiers.map((it) => ListTile(dense: true, title: Text(it.name), subtitle: Text('Id: ${it.id} Dist: ${it.distancePoints} Sprint: ${it.sprintPoints}'),)).toList()
              ],
      )
      ]);
    });
  }

}
