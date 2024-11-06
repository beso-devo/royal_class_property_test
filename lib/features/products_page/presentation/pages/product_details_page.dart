import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/core/util/extensions/extension_on_context.dart';
import 'package:royal_class_flutter_test/core/util/mixin/flush_bar_mixin.dart';
import 'package:royal_class_flutter_test/core/util/widgets/blur_border_widget.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/bloc/products_bloc.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/widgets/screen_background.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsPage({required this.product, super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with FlushBarMixin {
  PageController pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ProductsScreenBackground(),
          Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        print("sadasdasd");
                        Navigator.pop(context);
                      },
                      child:
                          SvgPicture.asset("assets/images/dummy/back_btn.svg")),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                    widget.product.title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.2),
                  ))
                ],
              ),
              SizedBox(
                height: context.h * 0.3,
                child: PageView(
                  controller: pageController,
                  children:
                      List.generate(widget.product.images.length, (index) {
                    return Image.network(
                      widget.product.images[index],
                      width: context.w * 0.3,
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(widget.product.images.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage.toInt() == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.2)),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                  child: BlurBorderWidget(
                borderRadius: 30,
                colors: const [
                  Color(0xff353F54),
                  Color(0xff222834),
                ],
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF323B4F),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xff252B39),
                                  blurRadius: 10,
                                  offset: Offset(4, 4),
                                ),
                                BoxShadow(
                                  color: Color(0xff38445A),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(-4, -4),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Description',
                              style: TextStyle(
                                color: Color(0xFF4286EE),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF28303F),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xff202633),
                                  blurRadius: 8,
                                  spreadRadius: -8,
                                  offset: Offset(4, 4),
                                ),
                                BoxShadow(
                                  color: Color(0xff364055),
                                  blurRadius: 8,
                                  spreadRadius: -8,
                                  offset: Offset(-4, -4),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Specification',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Text(
                          widget.product.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.product.description,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 15,
                              height: 1.2),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              const SizedBox(
                height: 100,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: getAddCartWidget(),
          )
        ],
      ),
    );
  }

  Widget getAddCartWidget() {
    return BlurBorderWidget(
        borderRadius: 50,
        onlyTopCorner: true,
        colors: const [
          Color(0xff353F54),
          Color(0xff222834),
        ],
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "\$ ${widget.product.price}",
                    style:
                        const TextStyle(color: Color(0xff3D9CEA), fontSize: 24),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<ProductsBloc>(context)
                          .onAddToCart(widget.product);
                      doneFlushBar(
                          title: "Done",
                          message:
                              "${widget.product.title} has been added to the cart!",
                          onHidden: () {},
                          context: context,
                          backgroundColor: Colors.green,
                          onChangeStatus: (s) {},
                          duration: Duration(seconds: 2));
                    },
                    child: SvgPicture.asset('assets/images/dummy/add-cart.svg'))
              ],
            ),
          ),
        ));
  }
}
