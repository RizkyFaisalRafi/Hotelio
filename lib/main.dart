import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelio/config/app_colors.dart';
import 'package:hotelio/config/app_route.dart';
import 'package:hotelio/config/session.dart';
import 'package:hotelio/model/user.dart';
import 'package:hotelio/view/detail_page.dart';
import 'package:hotelio/view/home_page.dart';
import 'package:hotelio/view/intro_page.dart';
import 'package:hotelio/view/sign_in_page.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundScaffold,
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: AppColors.primary,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
          )),
      routes: {
        '/': (context) {
          return FutureBuilder(
              future: Session.getUser(),
              builder: (context, AsyncSnapshot<User> snapshoot) {
                if (snapshoot.data == null || snapshoot.data!.id == null) {
                  return const IntroPage();
                } else {
                  return HomePage();
                }
              });
        },
        AppRoute.intro: (context) => const IntroPage(),
        AppRoute.home: (context) => HomePage(),
        AppRoute.signIn: (context) => SignInPage(),
        AppRoute.detail: (context) => DetailPage(),
        AppRoute.checkout: (context) => HomePage(),
        AppRoute.checkoutSuccess: (context) => HomePage(),
        AppRoute.detailBooking: (context) => HomePage(),
      },
    );
  }
}
