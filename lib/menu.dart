import 'package:flutter/material.dart';

import 'GeneralEncyclopedia/controllers.dart';

class Menu extends StatelessWidget {

  Menu();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            child: SearchFormController()
          ),
          FloatingActionButton(
            child: Text('->'),
            onPressed: () {
              
            }
          ),
        ]
      ),
    );
  }
}