import 'package:app/api/api.dart';
import 'package:app/api/auth/models/login.dto.dart';
import 'package:app/api/auth/models/login.response.dart';
import 'package:app/api/auth/models/send_confirmation_email.dto.dart';
import 'package:app/api/exceptions/bad_request.exception.dart';
import 'package:app/api/exceptions/forbidden.exception.dart';
import 'package:app/screens/loading.screen.dart';
import 'package:app/screens/register.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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

  void _togglePasswordObscure() {
    setState(() {
      _passwwordObsucred = !_passwwordObsucred;
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          heightFactor: 1,
          child: Text(message),
        ),
      ),
    );
  }

  void _handleResendEmailConfirmation(String email) async {
    await API.auth.email
        .sendConfirmationEmail(SendEmailConfirmationDto(email: email));
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Email sent'),
        content:
            const Text('The confirmation link has been sent to your email'),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _handleLogin(LoginDto loginDto) async {
    try {
      Overlay.of(context)?.insert(_loadingOverlay);

      LoginResponse response = LoginResponse.fromJson(
        await API.auth.login.login(loginDto),
      );

      await API.auth.saveToken(response.accessToken);
      _loadingOverlay.remove();

      _redirectLoading();
    } on BadRequestException {
      _showErrorSnackbar('Please enter your username and password');
    } on ForbiddenException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Text('You didn\'t confirm your email'),
              const Spacer(),
              GestureDetector(
                onTap: () => _handleResendEmailConfirmation(loginDto.username),
                child: Text(
                  'Resend',
                  style: TextStyle(
                    color: AppAssets.colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      _showErrorSnackbar('An error occurred ${e.toString()}');
    }
  }

  final _loadingOverlay = OverlayEntry(
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  void _redirectLoading() {
    Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
  }

  void _handleRedirectRegister() {
    Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
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
                width: 300.0,
              ),
              const SizedBox(
                height: 30.0,
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
                    onPressed: _togglePasswordObscure,
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
              const SizedBox(
                height: 30.0,
              ),
              SocialkoButton(
                width: width * 0.4,
                height: 50.0,
                text: 'Login',
                onPressed: () => _handleLogin(
                  LoginDto(
                    username: usernameController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextButton(
                onPressed: _handleRedirectRegister,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: AppAssets.colors.secondary,
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
