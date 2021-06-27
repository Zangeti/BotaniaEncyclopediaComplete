import 'package:flutter/material.dart';

import '../menu.dart';
import 'encyclopedia.dart';

class MyEnyclopedia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreen
      ),
      home: Scaffold(
        body: Encyclopedia(width: 400),
        bottomNavigationBar: Menu()
      )
    );
  }
}
