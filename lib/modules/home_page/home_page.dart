import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/modules/home_page/home_page_changepoke.dart';
import 'package:pokedex/modules/home_page/home_page_controller.dart';
import 'package:pokedex/shared/models/pokeall_models.dart';
import 'package:pokedex/shared/models/pokemon_models.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/widgets/screen_widget/screen_widget.dart';
import 'package:pokedex/shared/widgets/tools_widget/tools_widget.dart';
import 'package:pokedex/shared/widgets/upside_bar/upside_bar.dart';
import 'package:pokedex/shared/models/pokeall_models.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../shared/styles/app_audio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var changeColor = false;
  var controller = HomePageController();
  var controllerPoke = HomePageChangePoke();


  @override
  void initState() {
    controller.setPage(0);
    Timer(const Duration(seconds: 6), (){
      changeColor = true;
      controller.setPage(1);
      setState(() {});
    });
    super.initState();
  }

  Future<PokeAllModels> pokeAll() async {
    var url = Uri.http('pokeapi.co', '/api/v2/pokemon');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var pokeall = PokeAllModels.fromJson(json, controllerPoke.currentPoke);
    if(response.statusCode == 200){
      return pokeall;
    } else {
      throw Exception('Erro ao exibir os dados do servidor');      
    }
  }

  Future<PokemonModel> pokeList(urll) async {   
    String a = urll.substring(18); 
    var url = Uri.http('pokeapi.co', a);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var poke = PokemonModel.fromJson(json);
    if(response.statusCode == 200){
      return poke;
    } else {
      throw Exception('Erro ao exibir os dados do servidor');
    }
  }

  @override
  Widget build(BuildContext context) {



    final pages = [
      Center(
        child: Text('Iniciando...', style: GoogleFonts.pressStart2p(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),

      FutureBuilder<PokeAllModels>(
        future: pokeAll(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text('Erro ao carregar a lista de pokemons', style: GoogleFonts.pressStart2p(
                color: Colors.black
              ),),
            );
          }
          if(snapshot.hasData){
            return FutureBuilder<PokemonModel>(
              future: pokeList(snapshot.data!.url),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Center(
                    child: Text('Erro ao carregar a lista de pokemons', style: GoogleFonts.pressStart2p(
                      color: Colors.black
                    ),),
                  );
                }
                if(snapshot.hasData){
                  return PokeDataScreen(
                  name: snapshot.data!.name,
                  spriteUrl: snapshot.data!.spriteUrl,
                  type: snapshot.data!.type);
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  )
                );
              }
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            )
          );
        },
      ),

      FutureBuilder<PokeAllModels>(
        future: pokeAll(),
        builder: (context, snapshot){
          if(snapshot.hasError){
           return Center(
             child: Text('Erro ao carregar a lista de pokemons', style: GoogleFonts.pressStart2p(
                      color: Colors.black
              ),),
            );            
          }
          if(snapshot.hasData){
            return FutureBuilder<PokemonModel>(
              future: pokeList(snapshot.data!.url),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Center(
                   child: Text('Erro ao carregar a lista de pokemons', style: GoogleFonts.pressStart2p(
                     color: Colors.black
                   ),), 
                  );
                }
                if(snapshot.hasData){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-HP: ${snapshot.data!.hp}',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-Atk: ${snapshot.data!.atk}',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-Def: ${snapshot.data!.def}',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-SP.Atk: ${snapshot.data!.specialAtk}',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-SP.Def: ${snapshot.data!.specialDef}',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-Speed: ${snapshot.data!.speed}',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('-Total: ${
                          snapshot.data!.hp + snapshot.data!.atk + snapshot.data!.def + snapshot.data!.specialAtk + snapshot.data!.specialDef + snapshot.data!.speed
                        }',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black
                        )
                        ),
                      ),

                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),

      // FutureBuilder<PokemonModel>(
      //   future: pokeList(''),
      //   builder: (context, snapshot){
      //     if(snapshot.hasError){
      //       return const Center(
      //         child: Text('Erro ao carregar a lista de pokemons'),
      //       );
      //     }
      //     if(snapshot.hasData){
      //       return Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-HP: ${snapshot.data!.hp}', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-Atk: ${snapshot.data!.atk}', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-Def: ${snapshot.data!.def}', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-SP.Atk: ${snapshot.data!.specialAtk}', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-SP.Def: ${snapshot.data!.specialDef}', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-Speed: ${snapshot.data!.speed}', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 5),
      //             child: Text('-Total', style: GoogleFonts.pressStart2p(
      //               fontSize: 13,
      //               color: Colors.black
      //             ),),
      //           ),

      //         ],
      //       );
      //     }

      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },

      // ),


    ];  

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const UpSideBar(),
            ScreenWidget(
              widget: pages[controller.currentPage],
              changeColor: changeColor,
            ),
            ToolsWidget(
              upArrow: (){
              final player = AudioCache();
              player.play(AppAudio.arrowButtonsSound);
              controller.setPage(1);
              setState(() {});                
              },
              downArrow: (){
              final player = AudioCache();
              player.play(AppAudio.arrowButtonsSound);
              controller.setPage(2);  
              setState(() {});                
              },
              leftArrow: (){
              final player = AudioCache();
              player.play(AppAudio.arrowButtonsSound);
              controllerPoke.decrement();                
              setState(() {});  
              print(controllerPoke.currentPoke);
              
              },
              rightArrow: (){
              final player = AudioCache();
              player.play(AppAudio.arrowButtonsSound); 
              controllerPoke.increment(); 
              setState(() {});  
              print(controllerPoke.currentPoke);
              },
            )
          ],
        )
    
      ),
    );
  }
}

class PokeDataScreen extends StatefulWidget {
  final String name;
  final String spriteUrl;
  final String type;

  const PokeDataScreen({
     Key? key,
     required this.name,
     required this.spriteUrl,
     required this.type
  }) : super(key: key);

  @override
  State<PokeDataScreen> createState() => _PokeDataScreenState();
}

class _PokeDataScreenState extends State<PokeDataScreen> {
  @override
  Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(widget.name, style: GoogleFonts.pressStart2p(
      fontSize: 18,
      color: Colors.black
    ),),
    Image.network(widget.spriteUrl),
    Text('Type', style: GoogleFonts.pressStart2p(
      fontSize: 13,
      color: Colors.black
    ),),
    Text(widget.type, style: GoogleFonts.pressStart2p(
      fontSize: 14,
      color: Colors.black
    ))
    ],
  );
  }
}