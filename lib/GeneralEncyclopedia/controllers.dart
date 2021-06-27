// contains any & all form controllers :)


import 'package:flutter/material.dart';

class SearchFormController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SearchFormController();
  }
}

class _SearchFormController extends State<SearchFormController> {

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          
          hintText: 'Search...'
        ),
        controller: controller,
      ),
    ); 
  }
}