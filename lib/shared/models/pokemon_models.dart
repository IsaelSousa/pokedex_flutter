import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonModel {
  String name;
  String type;
  String spriteUrl;
  //Stats
  int hp;
  int atk;
  int def;
  int specialAtk;
  int specialDef;
  int speed;

  PokemonModel( 
    this.name,
    this.type,
    this.spriteUrl,
    this.hp,
    this.atk,
    this.def,
    this.specialAtk,
    this.specialDef,
    this.speed
   );

  factory PokemonModel.fromJson(Map json){
    return PokemonModel(
      json['name'], //name
      json['types'][0]['type']['name'], //types
      json['sprites']['front_default'], //spriteurl
      json['stats'][0]['base_stat'], //hp
      json['stats'][1]['base_stat'], //atk
      json['stats'][2]['base_stat'], //def
      json['stats'][3]['base_stat'], //special attack
      json['stats'][4]['base_stat'], //special defense
      json['stats'][5]['base_stat'] //speed
    );
  }

  // Future<PokemonModel> fetch() async {
  //   var url = Uri.http('pokeapi.co', '/api/v2/pokemon/1');
  //   var response = await http.get(url);
  //   var json = jsonDecode(response.body);
  //   var poke = PokemonModel.fromJson(json);
  //   return poke;
  // }

  // response() async {
  //   final resp = await fetch();
  //   return resp;
  // }

}