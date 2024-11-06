import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';
import 'package:royal_class_flutter_test/core/util/generate_screen.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/bloc/products_bloc.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/pages/product_details_page.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/widgets/category_button.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/widgets/featured_product_card.dart';
import 'package:sizer/sizer.dart';

import '../bloc/products_state.dart';
import '../widgets/product_card.dart';
import '../widgets/screen_background.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ProductsBloc>(context),
      builder: (BuildContext context, ProductsState state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                const ProductsScreenBackground(),
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Choose Your Bike',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                SvgPicture.asset(
                                  "assets/images/dummy/search.svg",
                                  width: 44,
                                )

                                // Container(
                                //   width: 50,
                                //   height: 50,
                                //   padding: const EdgeInsets.all(8),
                                //   decoration: BoxDecoration(
                                //     gradient: LinearGradient(
                                //       colors: [
                                //         Colors.blue.shade400,
                                //         Colors.blue.shade600
                                //       ],
                                //     ),
                                //     borderRadius: BorderRadius.circular(12),
                                //   ),
                                //   child: const Icon(
                                //     Icons.search,
                                //     color: Colors.white,
                                //     size: 35,
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            const FeaturedBikeCard(),
                            SizedBox(
                              width: context.w,
                              height: context.w * 0.13 + 50,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: CategoryButton(
                                      label: 'All',
                                      icon: '',
                                      isSelected: false,
                                      onlyText: true,
                                      width: 27,
                                      height: 27,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 40.0),
                                    child: CategoryButton(
                                      label: 'Electric',
                                      icon:
                                          'assets/images/products_categories/batteryblock.svg',
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.0),
                                    child: CategoryButton(
                                      label: 'Road',
                                      icon:
                                          'assets/images/products_categories/road.svg',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: CategoryButton(
                                      label: 'Mountain',
                                      icon:
                                          'assets/images/products_categories/mountains.svg',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: CategoryButton(
                                      label: 'Safety',
                                      icon:
                                          'assets/images/products_categories/helmet.svg',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /* const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ProductCard(
                                    title: 'Road Bike',
                                    subtitle: 'PEUGEOT - LR01',
                                    price: 1999.99,
                                    imagePath:
                                    'assets/images/products_categories/helmet.svg',
                                    height: 250,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: ProductCard(
                                    title: 'Road Helmet',
                                    subtitle: 'SMITH - Trade',
                                    price: 120,
                                    imagePath:
                                    'assets/images/products_categories/helmet.svg',
                                    height: 250,
                                  ),
                                ),
                              ],
                            ),*/

                            getProductsWidget(state, context)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getProductsWidget(ProductsState state, BuildContext context) {
    if (state.isLoadingProducts) {
      return const Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.6),
        children: List.generate(state.products.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(_createRoute(state.products[index]));
            },
            child: ProductCard(
              title: state.products[index].title,
              category: state.products[index].category.name,
              price: state.products[index].price,
              imagePath: state.products[index].images.isNotEmpty
                  ? state.products[index].images.first
                  : "",
              height: 300,
            ),
          );
        }),
      );
    }
  }

  Route _createRoute(ProductEntity product) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProductDetailsPage(product: product),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class SkewedCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Defining the skewed corners to simulate 3D perspective
    path.moveTo(size.width * 0.15, 0); // Top left corner, moved inwards
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(
        size.width * 0.85, size.height); // Bottom right corner, skewed inwards
    path.lineTo(0, size.height); // Bottom left corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Custom Clipper with rounded corners for the 3D skewed shape
class SkewedRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cornerRadius = 20.0; // Corner rounding size

    Path path = Path();

    // Start at top-left and draw the shape with rounded corners and skew
    path.moveTo(cornerRadius, 0); // Start with rounded corner at top-left
    path.lineTo(size.width - cornerRadius, 0); // Top edge
    path.quadraticBezierTo(
        size.width, 0, size.width, cornerRadius); // Top-right rounded corner

    path.lineTo(size.width, size.height - cornerRadius); // Right edge
    path.quadraticBezierTo(size.width, size.height, size.width - cornerRadius,
        size.height); // Bottom-right rounded corner

    // Skewed bottom-left side
    path.lineTo(
        size.width * 0.2 + cornerRadius, size.height); // Skewed bottom-left
    path.quadraticBezierTo(size.width * 0.2, size.height, size.width * 0.2,
        size.height - cornerRadius); // Bottom-left rounded corner

    // Left edge (skewed inward)
    path.lineTo(size.width * 0.2, cornerRadius); // Skewed left edge
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.2 + cornerRadius,
        0); // Top-left rounded corner

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
