import 'dart:io';

import 'package:flutter/material.dart';
import 'package:omiu/config/config.dart';
import 'package:omiu/widget/border_button_custom.dart';

import '../widget/app_drawer.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'complet_send.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({
    Key? key,
  }) : super(key: key);

  static const routeName = "ContactUs";

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> with TickerProviderStateMixin {
  final _couponController = TextEditingController();
  final _emailController = TextEditingController();
  final _descripstionController = TextEditingController();

  final _categoryController = TextEditingController();
  final _brandController = TextEditingController();

  bool _isLoading = false;

  final _searchlist = TextEditingController();

  bool isSearch = false;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  sendEmail({required String body, required String title}) async {
    String data =
        '<html><body><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style><table style="width:100%"><tr><th>${_brandController.text}</th> <th>اسم المتجر</th></tr><tr><th>${_categoryController.text}</th> <th>الفئة</th></tr><tr><th>${_couponController.text}</th> <th>الكوبون</th></tr><tr></table><h2 style="text-align:right;">: الوصف</h2><h2 style="text-align:right;">${_descripstionController.text}</h2></body></html>';

    setState(() {
      _isLoading = true;
    });
    String username = 'yassermsc8@gmail.com';
    String password = '123yasserMsc8';
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, _emailController.text)
      //      ..from = Address(username, "سمسار كوبون")
      //_emailController.text
      ..recipients.add('yasser8351@gmail.com')
      //..recipients.add('semsarcode@gmail.com')
      ..subject = 'اضافة كوبون'
      ..text = data
      ..html = data;
    try {
      final sendReport = await send(message, smtpServer);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => CompletSend())));
    } on MailerException {
      setState(() {
        _isLoading = false;
      });
      //notsendemail
      // Fluttertoast.showToast(
      //     msg: AppLocalizations.of(context)!.notsendemail,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 18.0);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(Config.notsendemail),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      drawer: const AppDrawer(),
      body: ListView(children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextfield(
                      label: Config.email,
                      controller: _emailController,
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _buildTextfield(
                      label: Config.description,
                      controller: _descripstionController,
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : BorderButtonCustom(
                            title: Config.send,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.red,
                            borderColor: Color.fromARGB(255, 125, 96, 96),
                            color: Colors.red,
                            icon: Icons.send,
                            onTap: () {
                              if (_emailController.text.isEmpty ||
                                  _couponController.text.isEmpty ||
                                  _descripstionController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(Config.fieldsrequired)));
                              } else {
                                sendEmail(
                                    title: _emailController.text,
                                    body: _descripstionController.text);
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: ((context) => CompletSend())));

                                //stop
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: ((context) => CompletSend())));
                              }
                            },
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

_buildTextfield({
  required TextEditingController controller,
  required String label,
  required bool obscure,
}) {
  return Material(
    elevation: 3,
    shadowColor: Colors.white30,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: TextField(
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.text,
        obscureText: obscure,
        // maxLength: 20,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(fontSize: 15, color: Color(0xffc8c8c8)),
          counterText: '',
        ),
        controller: controller,
      ),
    ),
  );
}
