import 'package:botania_encyclopaedia/util.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import '../menu.dart';
import 'plantInterface.dart';

class PlantSpecificScreen extends StatelessWidget {

  final PlantIdentifier plant;

  PlantSpecificScreen(this.plant);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreen
      ),
      home: Scaffold(
        body: PlantInterface(plant),
        bottomNavigationBar: Menu(),
      )
    );
  }
}