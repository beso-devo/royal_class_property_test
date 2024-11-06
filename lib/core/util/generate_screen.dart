import 'package:flutter/material.dart';
import 'package:royal_class_flutter_test/features/main_page/presentation/pages/main_page.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/pages/product_details_page.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/pages/products_page.dart';
import 'package:royal_class_flutter_test/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:royal_class_flutter_test/features/sign_up/presentation/pages/continue_as_guest_page.dart';
import 'package:royal_class_flutter_test/features/sign_up/presentation/pages/sign_up_page.dart';
import '../../features/splash/presentation/page/splash_page.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String? name = value.name;
    final args = value.arguments;
    print("the name is $name");
    switch (name) {
      case GeneralScreens.SPLASH_PAGE:
        return MaterialPageRoute(builder: (context) => const SplashPage());

      case GeneralScreens.SIGN_IN:
        return MaterialPageRoute(builder: (context) => const SignInPage());

      case GeneralScreens.SIGN_UP:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case GeneralScreens.CONTINUE_AS_GUEST:
        return MaterialPageRoute(
            builder: (context) => const ContinueAsGuestPage());

      case GeneralScreens.MAIN_PAGE:
        return MaterialPageRoute(builder: (context) => const MainPage());

      case GeneralScreens.PRODUCT_DETAILS:
        return MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
                product: (args as Map)['product']));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class GeneralScreens {
  static const String SPLASH_PAGE = "/";
  static const String SIGN_IN = "/sign_in";
  static const String SIGN_UP = "/sign_up";
  static const String CONTINUE_AS_GUEST = "/sign_up_guest";
  static const String MAIN_PAGE = "/admin-main-pages";
  static const String PRODUCT_DETAILS = "/product-details-page";
}
