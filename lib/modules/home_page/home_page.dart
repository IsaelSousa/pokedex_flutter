import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/widgets/screen_widget/screen_widget.dart';
import 'package:pokedex/shared/widgets/tools_widget/tools_widget.dart';
import 'package:pokedex/shared/widgets/upside_bar/upside_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: const [
            UpSideBar(),
            ScreenWidget(),
            ToolsWidget()
          ],
        )
    
      ),
    );
  }
}
