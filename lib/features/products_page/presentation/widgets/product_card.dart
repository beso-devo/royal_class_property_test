import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';
import 'package:royal_class_flutter_test/core/util/widgets/blur_border_widget.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 20.0;

    var path = Path();

    path.moveTo(0, size.height * 0.1);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);

    path.lineTo(size.width - roundnessFactor, size.height * 0.9);
    path.quadraticBezierTo(size.width, size.height * 0.88, size.width,
        (size.height * 0.9) - roundnessFactor);

    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width, 0, size.width - roundnessFactor * 4, roundnessFactor * 2);

    path.lineTo(roundnessFactor, size.height * 0.2 + 10);
    path.quadraticBezierTo(0, size.height * 0.2 + roundnessFactor, 0,
        size.height * 0.2 + roundnessFactor * 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String category;
  final double price;
  final double height;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.title,
    required this.category,
    required this.height,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.44,
      height: height,
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: Stack(
          children: [
            BlurBorderWidget(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    Center(
                      child: imagePath.isNotEmpty
                          ? Image.network(
                              imagePath,
                              height: 75,
                              fit: BoxFit.contain,
                            )
                          : Container(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      category,
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, right: 12),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    "assets/images/dummy/heart.svg",
                    width: 25,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
