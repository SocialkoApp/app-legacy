import 'package:app/api/home/home.screen.dart';
import 'package:app/screens/loading.screen.dart';
import 'package:app/screens/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/assets.util.dart';
import 'package:google_fonts/google_fonts.dart';

// Main app that handles all the routes and pages
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      theme: ThemeData(
        textTheme:
            GoogleFonts.firaCodeTextTheme(Theme.of(context).textTheme.apply(
                  bodyColor: AppAssets.colors.white,
                  displayColor: AppAssets.colors.white,
                )),
        colorScheme: ColorScheme.dark(
          primary: AppAssets.colors.primary,
          secondary: AppAssets.colors.secondary,
          background: AppAssets.colors.background,
          surface: AppAssets.colors.backgroundHighlight,
        ),
      ),
    );
  }
}
