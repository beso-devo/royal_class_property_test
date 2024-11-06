import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'core/di/injection_container.dart';
import 'core/util/custom_scroll_behavior.dart';
import 'core/util/generate_screen.dart';
import 'features/products_page/presentation/bloc/products_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = getIt<SharedPreferences>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductsBloc>(
                create: (context) => getIt<ProductsBloc>()),
          ],
          child: MaterialApp(
            title: 'Bike Shop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Poppins",
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFF242C3B),
              useMaterial3: true,
            ),
            builder: (context, child) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: Colors.transparent,
                ),
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: child!,
                ),
              );
            },
            initialRoute: GeneralScreens.SPLASH_PAGE,
            onGenerateRoute: GenerateScreen.onGenerate,
          ),
        );
      },
    );
  }
}
