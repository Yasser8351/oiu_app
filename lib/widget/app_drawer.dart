import 'package:flutter/material.dart';
import 'package:omiu/view/about_unevircety.dart';
import 'package:omiu/view/activitys.dart';
import 'package:omiu/view/college.dart';
import 'package:omiu/view/contact_us.dart';
import 'package:omiu/view/exams.dart';
import 'package:omiu/view/home.dart';
import 'package:omiu/view/news.dart';
import 'package:omiu/view/payment.dart';
import 'package:omiu/view/schedules.dart';

// ignore: must_be_immutable
class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  DateTime timeBackPressed = DateTime.now();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      //textDirection: TextDirection.ltr,
      textDirection: TextDirection.ltr,
      child: Drawer(
        elevation: 60,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.background,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, 1],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.green,
                    height: 120,
                  ),
                  ListTile(
                    title: const Text(
                      'أخبار الجامعة',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(News.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'حول الجامعة',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AboutUniversity.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'الجداول الدراسية',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.pending_actions_rounded,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Schedules.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'الامتحانات والشيتات',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.pending_actions_rounded,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Exams.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'الكليات',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.business,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(College.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'أنشطة',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.local_activity,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Activity.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'تواصل معنا',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(ContactUs.routeName);
                    },
                  ),
                  const SizedBox(height: 25),
                  ListTile(
                    title: const Text(
                      'تبرعات',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    leading: const Icon(
                      Icons.clean_hands,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Payment.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
