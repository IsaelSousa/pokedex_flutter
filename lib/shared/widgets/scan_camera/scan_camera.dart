import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';

class ScanCamera extends StatelessWidget {
  const ScanCamera({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.scancameraback,
                border: Border.all(color: AppColors.screenbackground, width: 5.0)
              ),
            ),

           Padding(
             padding: const EdgeInsets.only(
               top: 20,
               left: 20
             ),
             child: Container(
               width: 40,
               height: 40,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(90),
                 color: AppColors.scancameraup,
                 boxShadow: const [
                   BoxShadow(
                     color: AppColors.scancameraup,
                     spreadRadius: 3,
                     blurRadius: 4,
                   )
                 ]
               ),
             ),
           )
         ]
      );
  }
}