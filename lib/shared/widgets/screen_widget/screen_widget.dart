import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/styles/app_images.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SvgPicture.asset(
            AppImages.test,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 240,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.screenoff
              ),
            ),
          )
        ],
      ),
    );
  }
}