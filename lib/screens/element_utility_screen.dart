import 'package:flutter/material.dart';

class ElementUtilityScreen extends StatelessWidget {
  static String id = "add_list_screen";
  final Function(String name) elementCallback;
  String newElement;

  ElementUtilityScreen({this.elementCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text("Add New Element"),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value){
              newElement = value;
            },
          ),
          FlatButton(onPressed: () {
            elementCallback(newElement);
            Navigator.pop(context);
          }, child: Text("Add"),)
        ],
      ),
    );
  }
}
