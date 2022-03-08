import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageChangePoke {
  var currentPoke = 1;

  Future increment() async {
    var url = Uri.http('pokeapi.co', '/api/v2/pokemon');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var count = json['count'];

    if (currentPoke > count){
      currentPoke = 1;
    } else {
      currentPoke++;      
    }

  }

  Future decrement() async {
    var url = Uri.http('pokeapi.co', '/api/v2/pokemon');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var count = json['count'];    

    if(currentPoke < 1){
      currentPoke = count;
    }
      currentPoke--;
  }

  void test() async {
    var url = Uri.http('pokeapi.co', '/api/v2/pokemon');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var count = json['count'];     
    print(count);
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