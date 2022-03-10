import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageChangePoke {
  var currentPoke = 0;

  Future increment() async {
    // var url = Uri.http('pokeapi.co', '/api/v2/pokemon');
    // var response = await http.get(url);
    // var json = jsonDecode(response.body);
    // var count = json['count'];

    if (currentPoke > 1126){
      currentPoke = 0;
    } else {
      currentPoke++;      
    }

  }

  Future decrement() async {
    // var url = Uri.http('pokeapi.co', '/api/v2/pokemon');
    // var response = await http.get(url);
    // var json = jsonDecode(response.body);
    // var count = json['count'];    

    if(currentPoke < 0){
      currentPoke = 1126;
    }
      currentPoke--;
  }
}

    // var url = Uri.http('pokeapi.co', '/api/v2/pokemon/1');
    // var response = await http.get(url);
    // var json = jsonDecode(response.body);
    // var poke = PokemonModel.fromJson(json);
    // if(response.statusCode == 200){
    //   return poke;
    // } else {
    //   throw Exception('Erro ao exibir os dados do servidor');
    // }