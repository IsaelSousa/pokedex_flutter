class PokeAllModels {
  String name;
  String url;


  PokeAllModels( 
    this.name,
    this.url,

   );

  factory PokeAllModels.fromJson(Map json, int index){
    return PokeAllModels(
      json['results'][index]['name'], //name
      json['results'][index]['url'], //url
    );
  }

}