import 'package:flutter/cupertino.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';

class ProductsScreenBackground extends StatelessWidget {
  const ProductsScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ProductBackgroundClipper(),
      child: Container(
        width: context.w,
        height: context.h,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff37B6E9),
            Color(0xff4B4CED),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
      ),
    );
  }
}

class ProductBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
