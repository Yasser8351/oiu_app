import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:omiu/config/config.dart';
import 'package:omiu/widget/no_data.dart';

import 'detail_screen.dart';

class News extends StatefulWidget {
  static const routeName = '/News';

  const News({Key? key}) : super(key: key);
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  Stream<QuerySnapshot> getData() =>
      FirebaseFirestore.instance.collection("news").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        child: SizedBox(
          height: double.infinity,
          child: StreamBuilder(
            stream: getData(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              final data = snapshot.data!.docs;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (data.isEmpty) {
                return const NoDataFound();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (ctx, index) {
                        var date = data[index]["time"];
                        var title = data[index]["title"];
                        var imageUrl = data[index]["imageUrl"];
                        var descripstion = data[index]["descripstion"];
                        // var date = DateTime.fromMillisecondsSinceEpoch(
                        //     timestamp * 1000);

                        return Card(
                          elevation: 10,
                          child: Column(children: [
                            SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Image.network(
                                  imageUrl,
                                )),
                            Text(
                              title,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                            // const SizedBox(height: 10),
                            // Text(
                            //   data[index]["descripstion"],
                            //   style: const TextStyle(
                            //       color: Colors.black, fontSize: 18),
                            // ),
                            const SizedBox(height: 10),
                            Text(
                              Config.since + date.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => DetailScreen(
                                            description: descripstion,
                                            title: title,
                                          )));
                                },
                                child: const Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      Config.viewNews,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ]),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
