import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';

class KeyboardWidget extends StatelessWidget {
  final VoidCallback upArrowKey;
  final VoidCallback downArrowKey;
  final VoidCallback leftArrowKey;
  final VoidCallback rightArrowKey;  

  const KeyboardWidget({
     Key? key,
     required this.upArrowKey,
     required this.downArrowKey,
     required this.leftArrowKey,
     required this.rightArrowKey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        GestureDetector(
          onTap: upArrowKey,
          child: Container(
            width: 40,
            height: 45,
            decoration: const BoxDecoration(
              color: AppColors.screenoff,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5)
                ),
              
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: leftArrowKey,
              child: Container(
                width: 45,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.screenoff,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)
                    )
                ),
              ),
            ),            

            Stack(
              alignment: AlignmentDirectional.center,
              children: [

                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.screenoff,
                  ),
                ),

                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3A3A3A),
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),

              ],
            ),             

            GestureDetector(
              onTap: rightArrowKey,
              child: Container(
                width: 45,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.screenoff,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                    )
                ),
              ),
            ),  

          ],
        ),

        GestureDetector(
          onTap: downArrowKey,
          child: Container(
            width: 40,
            height: 45,
            decoration: const BoxDecoration(
              color: AppColors.screenoff,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)
                )
            ),
          ),
        ),    

      ],
    );
  }
}