import 'package:flutter/material.dart';
import 'package:omiu/config/config.dart';
import 'package:omiu/widget/app_drawer.dart';

class Schedules extends StatelessWidget {
  const Schedules({Key? key}) : super(key: key);

  static const routeName = "Schedules";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Config.schedules,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
