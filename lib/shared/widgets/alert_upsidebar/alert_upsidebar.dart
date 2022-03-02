import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';

class AlertUpSidebar extends StatelessWidget {
  String colorStyle;

  AlertUpSidebar({Key? key, required this.colorStyle }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color changeColor(){
      if (colorStyle == '1'){
        return AppColors.alertRed;
      } else if (colorStyle == '2'){
        return AppColors.alertGreen;
      } else {
        return AppColors.alertYellow;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: changeColor(),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 10,
            )
          ]
        ),
      ),
    );
  }
}