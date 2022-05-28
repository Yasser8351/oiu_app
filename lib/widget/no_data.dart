import 'package:flutter/material.dart';
import 'package:omiu/config/config.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        Config.noData,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
