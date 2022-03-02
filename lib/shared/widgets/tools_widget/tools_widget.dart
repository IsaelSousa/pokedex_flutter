import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/widgets/keyboard_widget/keyboard_widget.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.screenoff,
            borderRadius: BorderRadius.circular(100)
          ),
        ),

        Container(
          width: 140,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.bottomscreen,
            borderRadius: BorderRadius.circular(10)
          ),
        ),

        const KeyboardWidget(),

      ],
    );
  }
}