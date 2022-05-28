import 'package:flutter/material.dart';
import 'package:omiu/view/about_unevircety.dart';
import 'package:omiu/view/activitys.dart';
import 'view/college.dart';
import 'view/contact_us.dart';
import 'view/exams.dart';
import 'view/home.dart';
import 'view/news.dart';
import 'view/payment.dart';
import 'view/schedules.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';


// fonts:
//     - family: Changa
//       fonts:
//         - asset: assets/fonts/Changa.ttf

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //await FirebaseMessaging.instance.setAutoInitEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OIU',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const News(),
      routes: {
        Home.routeName: (ctx) => const Home(),
        ContactUs.routeName: (ctx) => const ContactUs(),
        News.routeName: (ctx) => const News(),
        AboutUniversity.routeName: (ctx) => const AboutUniversity(),
        Payment.routeName: (ctx) => const Payment(),
        Schedules.routeName: (ctx) => const Schedules(),
        College.routeName: (ctx) => const College(),
        Activity.routeName: (ctx) => const Activity(),
        Exams.routeName: (ctx) => const Exams(),
      },
    );
  }
}
