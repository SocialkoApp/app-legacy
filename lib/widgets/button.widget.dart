import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class SocialkoButton extends StatelessWidget {
  const SocialkoButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            AppAssets.colors.primary,
            AppAssets.colors.secondary,
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 8,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppAssets.colors.white,
          ),
        ),
      ),
    );
  }
}
