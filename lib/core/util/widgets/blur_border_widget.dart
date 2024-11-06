import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class BlurBorderWidget extends StatelessWidget {
  final bool isSelected;
  final Widget child;
  final double borderRadius;
  final bool onlyTopCorner;
  final List<Color>? colors;

  BlurBorderWidget(
      {this.isSelected = false,
      this.onlyTopCorner = false,
      this.borderRadius = 12,
      this.colors,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade600],
              )
            : LinearGradient(
                colors: colors ??
                    [
                      const Color(0xff353F54),
                      const Color(0xff222834),
                    ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2)
          ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
          width: 1,
        ),
        color: isSelected ? null : Colors.grey.shade900,
        borderRadius: onlyTopCorner
            ? BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              )
            : BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
