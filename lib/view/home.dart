//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:omiu/widget/app_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    //FirebaseMessaging.instance.subscribeToTopic('oiu');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              //Scaffold.of(context).openDrawer();
              _drawerKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.book, color: Colors.white)),
      ),
      drawer: const AppDrawer(),
    );
  }
}
