import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/util/widgets/blur_border_widget.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final String icon;
  final bool isSelected;
  final bool onlyText;
  final double width;
  final double height;

  const CategoryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.width,
    required this.height,
    this.isSelected = false,
    this.onlyText = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onSelectCategory();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: context.w * 0.13,
        height: context.w * 0.13,
        child: BlurBorderWidget(
          isSelected: isSelected,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !onlyText,
                child: SvgPicture.asset(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey,
                  width: width,
                  height: height,
                ),
              ),
              Visibility(
                visible: onlyText,
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
