import 'package:factory_task/about_us/about_us.dart';
import 'package:factory_task/auth/login/login.dart';
import 'package:factory_task/auth/signup/register.dart';
import 'package:factory_task/home/home.dart';
import 'package:factory_task/onBoarding/onBoardingScreen.dart';
import 'package:factory_task/sec_facility/maintain/maintain.dart';
import 'package:factory_task/sec_facility/sec_facility.dart';
import 'package:factory_task/sec_facility/settings/empty1.dart';
import 'package:factory_task/sec_facility/settings/empty2.dart';
import 'package:factory_task/sec_facility/settings/empty3.dart';
import 'package:factory_task/sec_facility/settings/settings.dart';
import 'package:factory_task/sub_fprm/sub_form.dart';
import 'package:factory_task/sub_fprm/submit_form.dart';
import 'package:factory_task/svs_type/svs_type.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/onBoarding', // Set initial screen
        routes: {
          '/onBoarding': (context) => Onboardingscreen(),
          '/login': (context) => const Login(),
          '/register': (context) => Register(),
          '/home': (context) => const Home(),
          '/about': (context) => AboutUs(),
          '/sec_fac': (context) => const SecFacility(),
          '/maintain': (context) => const MaintenancePage(),
          '/settings': (context) => const SettingsPage(),
          '/svs_type': (context) => const SVSScreen(),
          '/sub_form': (context) => const SubForm(),
          '/submit': (context) => const SubmitForm(),
          '/empty1': (context) => const Empty1(),
          '/empty2': (context) => const Empty2(),
          '/empty3': (context) => const Empty3(),
        });
  }
}
