import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _passwwordObsucred = true;

  @override
  void initState() {
    super.initState();
  }

  void togglePasswordObscure() {
    setState(() {
      _passwwordObsucred = !_passwwordObsucred;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppAssets.colors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.images.logoNoBg,
                width: width * 0.5,
              ),
              TextField(
                controller: usernameController,
                cursorColor: AppAssets.colors.secondary,
                decoration: AppAssets.inputDecoration.copyWith(
                  label: Text(
                    'Username',
                    style: TextStyle(
                      color: AppAssets.colors.white,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppAssets.colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: passwordController,
                cursorColor: AppAssets.colors.secondary,
                obscureText: _passwwordObsucred,
                obscuringCharacter: '*',
                decoration: AppAssets.inputDecoration.copyWith(
                  label: Text(
                    'Password',
                    style: TextStyle(
                      color: AppAssets.colors.white,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppAssets.colors.white,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => togglePasswordObscure(),
                    icon: _passwwordObsucred
                        ? Icon(
                            Icons.visibility,
                            color: AppAssets.colors.white,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppAssets.colors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
