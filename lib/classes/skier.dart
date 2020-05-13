import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Skier {
  final int id;
  final String name;
  final double sprintPoints;
  final double distancePoints;

  static Map<int, Skier> cache = HashMap<int, Skier>();

  Skier({this.id: -1, this.name, this.sprintPoints: 0, this.distancePoints : 0}) {
    if (sprintPoints != 0 && distancePoints != 0) {
      Skier.cache[id] = this;
    }
  }



  static Future<Skier> fetch(int id) async {
       if (Skier.cache.containsKey(id)) {
         return Future.value(Skier.cache[id]);
       }

      if (id < 10000) {
        return Future.value(Skier(name: 'Type More...'));
      }

      final response =  await http.get('https://www.xcracer.info/api/skiercurrentpoints/$id');
      final data =  json.decode(response.body);
      final s = data['results'];
      return Skier(
        id: id,
        name: s['name'] as String,
        sprintPoints: s['sprintPoints'] as double,
        distancePoints: s['distancePoints'] as double,
      );
  }

  static Future<List<Skier>> skiersLike(String n) async {

    if ( n.length < 5) {
      return Future.value([Skier(name: 'Type More...')]);
    }
    final response =  await http.get('https://www.xcracer.info/api/skierslike/${n.replaceAll(' ', '_')}');
    final data =  json.decode(response.body);
    final list = data['results'] as List;
    return list.map((it)=>Skier(
      id: it['id'] as int,
      name: (it['firstname'] as String) + ' ' + (it['lastname'] as String),
    )).toList();
  }


}


