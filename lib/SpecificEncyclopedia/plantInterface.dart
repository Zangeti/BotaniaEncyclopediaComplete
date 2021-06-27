import 'dart:ui';

import 'package:botania_encyclopaedia/util.dart';
import 'package:flutter/material.dart';

class PlantInterface extends StatelessWidget {
  
  final PlantIdentifier plant;

  PlantInterface(this.plant);

  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(left : 50, top: 50, right: 20, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PlantHeader(plant),
            PlantImage(plant),
            PlantSale(plant),
            PlantDescription(plant)
          ]
        )
      )
    );
  }
}

class PlantHeader extends StatelessWidget {

  final PlantIdentifier plant;

  PlantHeader(this.plant);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                plant.scientificName,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87
                )
              )
            )
          )
        ),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Container(
            height: 20,
            child: Align(
              alignment: Alignment.topLeft,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  plant.commonName,
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54
                  )
                )
              )
            )
          )
        )
      ]
    );
  }
}

class PlantImage extends StatelessWidget {

  final PlantIdentifier plant;

  PlantImage(this.plant);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/plants/' + plant.scientificName.replaceAll(" ", "_").toLowerCase() + ".png",
          fit: BoxFit.cover,
          
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 3
            )
          ]
        ),
      )
    );
  }
}


class PlantSale extends StatelessWidget {

  final PlantIdentifier plant;

  PlantSale(this.plant);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Search for in Store...',
        )
      )
    );
  }
}

class PlantDescriptionAttribute extends StatelessWidget {
  
  final String title;
  final String content;

  PlantDescriptionAttribute(this.title, this.content);
  
  @override
  Widget build(BuildContext context) {

    String finalContent = content;
    if (finalContent.endsWith(".")) {
      finalContent = content.substring(0, content.length-2);
    }

    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Card(
            color: Colors.lightGreen,
            child: Padding(
              padding: EdgeInsets.all(10),
              child:Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87
                  ),
                )
              )
            )
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  " -  " + finalContent.replaceAll(".", ".\n - "),
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              )
            )
          )
        ]
      )
    );
  }
}

class PlantDescription extends StatelessWidget {

  final PlantIdentifier plant;

  PlantDescription(this.plant);

  @override
  Widget build(BuildContext context) {
    List<Widget> info = [];

    if (plant.sowingInstructions != "") {
      info.add(
        PlantDescriptionAttribute("How to Sow:", plant.sowingInstructions)
      );
    }

    if (plant.spaceInstructions != "") {
      info.add(
        PlantDescriptionAttribute("Where to Plant:", plant.spaceInstructions)
      );
    }

    if (plant.harvestInstructions != "") {
      info.add(
        PlantDescriptionAttribute("How to Harvest:", plant.harvestInstructions)
      );
    }

    if (plant.compatiblePlants != "") {
      info.add(
        PlantDescriptionAttribute("Other Compatible Plants:", plant.compatiblePlants)
      );
    }

    if (plant.avoidInstructions != "") {
      info.add(
        PlantDescriptionAttribute("Common Problems:", plant.avoidInstructions)
      );
    }

    if (plant.culinaryHints != "") {
      info.add(
        PlantDescriptionAttribute("Culinary Ideas:", plant.culinaryHints)
      );
    }

    if (plant.culinaryPreservation != "") {
      info.add(
        PlantDescriptionAttribute("Culinary Preservations:", plant.culinaryPreservation)
      );
    }

    return Column(
      children: info,
    );
  }
}