import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/widgets/alert_upsidebar/alert_upsidebar.dart';

class AlertInline extends StatelessWidget {
  const AlertInline({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
       AlertUpSidebar(colorStyle: '1',),
       AlertUpSidebar(colorStyle: '2',),
       AlertUpSidebar(colorStyle: '3',)
      ],
    );
  }
}
