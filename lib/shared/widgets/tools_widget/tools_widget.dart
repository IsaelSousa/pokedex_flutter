import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/widgets/keyboard_widget/keyboard_widget.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 200),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.screenoff,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 140),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 8,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),

                    Container(
                      height: 8,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),                    
                    ),

                  ],
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

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10,bottom: 80),
          child: KeyboardWidget(
            upArrowKey: (){},
            downArrowKey: (){},
            leftArrowKey: (){},
            rightArrowKey: (){},
          ),
        )

      ],
    );
  }
}