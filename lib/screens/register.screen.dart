import 'package:app/api/api.dart';
import 'package:app/api/auth/models/login.dto.dart';
import 'package:app/api/auth/models/register.dto.dart';
import 'package:app/api/auth/models/send_confirmation_email.dto.dart';
import 'package:app/api/exceptions/bad_request.exception.dart';
import 'package:app/api/exceptions/conflict.exception.dart';
import 'package:app/api/exceptions/forbidden.exception.dart';
import 'package:app/screens/email_confirmation.screen.dart';
import 'package:app/screens/login.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

  void _handleRegister(RegisterDto registerDto) async {
    if (passwordController.text != confirmPasswordController.text) {
      _showErrorSnackbar('Passwords do not match');
      return;
    }
    try {
      await API.auth.register.register(registerDto);
      Navigator.of(context)
          .pushReplacementNamed(EmailConfirmationScreen.routeName);
    } on BadRequestException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all fields'),
        ),
      );
    } on ConflictException catch (e) {
      _showErrorSnackbar(e.message);
    }
  }

  void _handleRedirectSignIn() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
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
                controller: firstNameController,
                cursorColor: AppAssets.colors.secondary,
                decoration: AppAssets.inputDecoration.copyWith(
                  label: Text(
                    'First name',
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
                height: 5.0,
              ),
              TextField(
                controller: lastNameController,
                cursorColor: AppAssets.colors.secondary,
                decoration: AppAssets.inputDecoration.copyWith(
                  label: Text(
                    'Last name',
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
                height: 5.0,
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
                height: 5.0,
              ),
              TextField(
                controller: emailController,
                cursorColor: AppAssets.colors.secondary,
                decoration: AppAssets.inputDecoration.copyWith(
                  label: Text(
                    'Email',
                    style: TextStyle(
                      color: AppAssets.colors.white,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppAssets.colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
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
                height: 5.0,
              ),
              TextField(
                controller: confirmPasswordController,
                cursorColor: AppAssets.colors.secondary,
                obscureText: _passwwordObsucred,
                obscuringCharacter: '*',
                decoration: AppAssets.inputDecoration.copyWith(
                  label: Text(
                    'Confirm password',
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
                text: 'Register',
                onPressed: () => _handleRegister(
                  RegisterDto(
                    email: emailController.text,
                    username: usernameController.text,
                    password: passwordController.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                  ),
                ),
              ),
              TextButton(
                onPressed: _handleRedirectSignIn,
                child: Text(
                  'Login',
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
