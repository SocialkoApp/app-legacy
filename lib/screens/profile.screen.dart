import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/profile/head.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final String _username = 'aikenahac';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppAssets.colors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'socialko',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    IconlyLight.setting,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          ProfileHead(),
        ],
      ),
    );
  }
}
