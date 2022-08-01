import 'package:app/screens/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:app/api/api.dart';
import 'login.screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static const routeName = '/loading';

  void _checkAuthentication(BuildContext context) async {
    if (!await API.auth.isLoggedIn()) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAuthentication(context);

    return const Scaffold();
  }
}
