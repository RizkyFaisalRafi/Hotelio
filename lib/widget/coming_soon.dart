import 'package:flutter/material.dart';
import 'package:hotelio/config/app_assets.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.iconComingSoon,
            fit: BoxFit.cover,
            height: 120,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Coming Soon',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'We are developing this page\nfor new great features',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
