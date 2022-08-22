import 'package:app/screens/email_confirmation.screen.dart';
import 'package:app/screens/loading.screen.dart';
import 'package:app/screens/login.screen.dart';
import 'package:app/screens/main.screen.dart';
import 'package:app/screens/register.screen.dart';
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
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        EmailConfirmationScreen.routeName: (context) =>
            const EmailConfirmationScreen(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.firaCodeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppAssets.colors.white,
                displayColor: AppAssets.colors.white,
              ),
        ),
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
