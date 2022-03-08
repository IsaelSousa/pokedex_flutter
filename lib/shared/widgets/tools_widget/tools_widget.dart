import 'package:flutter/material.dart';
import 'package:pokedex/shared/styles/app_colors.dart';
import 'package:pokedex/shared/widgets/keyboard_widget/keyboard_widget.dart';

class ToolsWidget extends StatefulWidget {
  final VoidCallback upArrow;
  final VoidCallback downArrow;
  final VoidCallback leftArrow;
  final VoidCallback rightArrow;
  const ToolsWidget({
  Key? key,
  required this.upArrow,
  required this.downArrow,
  required this.leftArrow,
  required this.rightArrow }) : super(key: key);

  @override
  State<ToolsWidget> createState() => _ToolsWidgetState();
}

class _ToolsWidgetState extends State<ToolsWidget> {
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
              borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: AppColors.keyboardboxshadow,
                offset: Offset(-2, 1),
                spreadRadius: 1
              )
            ]
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
                width: 120,
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
          padding: const EdgeInsets.only(left: 20,bottom: 14),
          child: KeyboardWidget(
            upArrowKey: widget.upArrow,
            downArrowKey: widget.downArrow,
            leftArrowKey: widget.leftArrow,
            rightArrowKey: widget.rightArrow,
          ),
        )

      ],
    );
  }
}