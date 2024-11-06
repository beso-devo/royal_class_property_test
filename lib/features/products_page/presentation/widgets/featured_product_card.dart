import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';
import 'package:royal_class_flutter_test/core/util/widgets/blur_border_widget.dart';
import 'package:sizer/sizer.dart';

class FeaturedBikeCard extends StatelessWidget {
  const FeaturedBikeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurBorderWidget(
      child: SizedBox(
        // height: 200,
        width: context.w,
        child: BlurBorderWidget(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.asset(
                  width: context.w,
                  'assets/images/dummy/eb.png',
                  height: 160,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '30% Off',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
