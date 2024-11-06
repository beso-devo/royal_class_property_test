import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_class_flutter_test/core/util/colors.dart';
import 'package:royal_class_flutter_test/core/util/mixin/flush_bar_mixin.dart';
import 'package:royal_class_flutter_test/features/main_page/presentation/bloc/main_page_bloc.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/bloc/products_bloc.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/pages/cart_page.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/pages/products_page.dart';
import '../../../../core/di/injection_container.dart';
import '../bloc/main_page_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with FlushBarMixin {
  final _bloc = getIt<MainPageBloc>();

  List<Widget> pages = [
    const ProductsScreen(),
    Container(),
    const CartScreen(),
    Container(),
    Container()
  ];

  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).onGetProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext mainContext) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, MainPageState state) {
        return Scaffold(
          // bottomNavigationBar: _bottomNavigationBar(state),
          body: Stack(
            children: [
              PageTransitionSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) =>
                    FadeThroughTransition(
                  fillColor: AppColors.backgroundColor,
                  secondaryAnimation: secondaryAnimation,
                  animation: animation,
                  child: child,
                ),
                child: pages[state.currentPageIndex],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _bottomNavigationBar(state),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _bottomNavigationBar(MainPageState state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10 + 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.10,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff363E5166).withOpacity(1),
                      const Color(0xff181C2466).withOpacity(1),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  color: AppColors.subBlackColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 5,
                        offset: Offset(0, -1))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavBarItem(
                  isSelected: state.currentPageIndex == 0,
                  onClick: () => _navigateTo(0),
                  imgPath: 'assets/images/bottom_navbar_icons/bicycle.svg',
                ),
                BottomNavBarItem(
                  isSelected: state.currentPageIndex == 1,
                  onClick: () => _navigateTo(1),
                  imgPath: 'assets/images/bottom_navbar_icons/map.svg',
                ),
                BottomNavBarItem(
                  isSelected: state.currentPageIndex == 2,
                  onClick: () => _navigateTo(2),
                  imgPath: 'assets/images/bottom_navbar_icons/cart.svg',
                ),
                BottomNavBarItem(
                  isSelected: state.currentPageIndex == 3,
                  onClick: () => _navigateTo(3),
                  imgPath: 'assets/images/bottom_navbar_icons/person.svg',
                ),
                BottomNavBarItem(
                  isSelected: state.currentPageIndex == 4,
                  onClick: () => _navigateTo(4),
                  imgPath: 'assets/images/bottom_navbar_icons/document.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _navigateTo(int index) {
    _bloc.onPageChanged(index);
  }
}

class BottomNavBarItem extends StatelessWidget {
  final String imgPath;
  final Function onClick;
  final bool isSelected;

  const BottomNavBarItem(
      {required this.imgPath,
      required this.onClick,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return SizedBox(
        height: MediaQuery.of(context).size.width * 0.155,
        width: 90,
        child: Stack(
          children: [
            Center(
              child: Transform(
                transform: Matrix4.skewX(-0.1),
                child: Transform(
                  transform: Matrix4.skewY(-0.15),
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(1, 6))
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff4E4AF2),
                          Color(0xff34C8E8),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    imgPath,
                    width: 35,
                    height: 35,
                  )),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: IconButton(
          icon: SvgPicture.asset(
            imgPath,
            width: 25,
            height: 25,
          ),
          onPressed: () {
            onClick();
          },
        ),
      );
    }
  }
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30.0;

    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(
          size.width, size.height, size.width - radius, size.height)
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..lineTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
