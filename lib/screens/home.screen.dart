import 'package:app/api/api.dart';
import 'package:app/screens/loading.screen.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    void _handleLogout() async {
      await API.auth.deleteToken();
      Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
    }

    return Scaffold(
      body: Center(
        child: SocialkoButton(
          width: width * 0.7,
          height: 50.0,
          text: 'Logout',
          onPressed: _handleLogout,
        ),
      ),
    );
  }
}
