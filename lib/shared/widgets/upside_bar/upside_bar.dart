import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/styles/app_images.dart';
import 'package:pokedex/shared/widgets/alert_inline/alert_inline.dart';
import 'package:pokedex/shared/widgets/scan_camera/scan_camera.dart';

class UpSideBar extends StatelessWidget {
  const UpSideBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
        AppImages.vector,
        width: MediaQuery.of(context).size.width,
        color: AppColors.upside,
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 25
          ),
          child: ScanCamera()
        ),

        const Positioned(
          top: 25 ,
          left: 130,
          child: AlertInline(),
        )
      ]
    );
  }
}