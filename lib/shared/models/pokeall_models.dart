class PokeAllModels {
  String name;
  String url;


  PokeAllModels( 
    this.name,
    this.url,

   );

  factory PokeAllModels.fromJson(Map json){
    return PokeAllModels(
      json['results']['name'], //name
      json['results']['url'], //url
    );
  }

}