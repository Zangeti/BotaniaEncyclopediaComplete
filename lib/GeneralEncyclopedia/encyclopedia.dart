import 'package:flutter/material.dart';

import '../util.dart';
import '../out.dart';
import '../SpecificEncyclopedia/main.dart';

class Encyclopedia extends StatefulWidget {

  final String searchEntry;

  final double width;

  final List<PlantIdentifier> plantNames = plants;

  Encyclopedia({this.width = 300, this.searchEntry=''});

  @override
  State<StatefulWidget> createState() {
    return _Encyclopedia();
  }
}

// Load Encyclopedia Overview
class _Encyclopedia extends State<Encyclopedia> {

  @override
  Widget build(BuildContext context) {

    List<PlantIdentifier> plants = widget.plantNames.where((element) => (
        widget.searchEntry.length == 0 ||
        element.scientificName.contains(widget.searchEntry) ||
        (element.commonName.contains(widget.searchEntry) && (element.commonName.length != 0))
      )
    ).toList();

    return SingleChildScrollView(
      child: Column(
        children: plants.asMap().entries.map((element) => Card(
          color: (element.key%2 == 0 ? Colors.green : Colors.greenAccent),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlantSpecificScreen(element.value))
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: widget.width,
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          element.value.scientificName,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87
                          ),
                        )
                      )
                    )
                  ),
                  Container(
                    width: widget.width,
                    height: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child:Text(
                          element.value.commonName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Colors.black54
                          ),
                        )
                      )
                    )
                  )
                ]
              )
            )
          )
        )).toList()
      )
    );
  }
}