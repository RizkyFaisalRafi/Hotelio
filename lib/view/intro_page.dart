import 'package:flutter/material.dart';
import 'package:hotelio/config/app_assets.dart';
import 'package:hotelio/config/app_route.dart';
import 'package:hotelio/widget/button_custom.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bgIntro,
            fit: BoxFit.cover,
          ),
          Container(
            height:
                MediaQuery.of(context).size.height * 0.4, // Agar menjadi 40%
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Your Great Life\nStarts Here",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  "More than just a hotel",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonCustom(
                  label: 'Get Started',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoute.signIn);
                  },
                  isExpand: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
