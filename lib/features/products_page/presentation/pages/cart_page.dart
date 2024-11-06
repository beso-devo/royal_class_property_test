import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_class_flutter_test/app.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/core/util/colors.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';
import 'package:royal_class_flutter_test/core/util/widgets/blur_border_widget.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/bloc/products_bloc.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/bloc/products_state.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/widgets/screen_background.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  /// We have to combine the products by id in the UI because in this case the products
  /// will be repeated.
  ///
  /// And also this page should own it's private bloc files also.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ProductsScreenBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 12, right: 12),
                child: Text(
                  'Shopping Cart',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder(
                  bloc: BlocProvider.of<ProductsBloc>(context),
                  builder: (BuildContext context, ProductsState state) {
                    if (state.cartProducts.isEmpty) {
                      return Center(
                        child: Text(
                          "No products in the cart!",
                          style: TextStyle(
                              color: AppColors.hintTextFieldColor,
                              fontSize: 12.sp),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: state.cartProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                getCartWidget(state, state.cartProducts[index]),
                                index == state.cartProducts.length - 1
                                    ? getCheckOutButton()
                                    : Container()
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getCheckOutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Container(
        width: context.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff363E5166).withOpacity(1),
                const Color(0xff181C2466).withOpacity(1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45, blurRadius: 5, offset: Offset(0, -1))
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Checkout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCartWidget(ProductsState state, ProductEntity product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: BlurBorderWidget(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  BlurBorderWidget(
                    child: Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        product.images.first,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.w * 0.5,
                        child: Text(
                          product.title + 'ioasdj sapodasd sad',
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.category.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$ ${product.price}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                  BlurBorderWidget(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            iconSize: 18,
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            state.cartProducts
                                .where(
                                    (element) => element.title == product.title)
                                .length
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: 18,
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
