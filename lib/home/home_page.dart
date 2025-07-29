import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: AppBar(title: TextField()),
        body: Text('글자가 잘 나오나?'),
      ),
    );
  }
}
