import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String title;

  NewsModel({required this.title});

  factory NewsModel.fromJson(DocumentSnapshot snapshot) {
    return NewsModel(
      title: snapshot['title'] ?? '',
    );
  }
}
