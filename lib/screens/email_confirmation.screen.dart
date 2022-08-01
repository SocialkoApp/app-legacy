import 'package:app/screens/login.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class EmailConfirmationScreen extends StatelessWidget {
  static const routeName = '/confirm';

  const EmailConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    void _handleOk() {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return Scaffold(
      backgroundColor: AppAssets.colors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100.0),
              const Text(
                'Confirm email',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'To continue please click the link in the email we just sent you.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SocialkoButton(
                  text: 'OK',
                  onPressed: _handleOk,
                  width: width,
                  height: 50.0,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
