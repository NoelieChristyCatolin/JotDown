import 'package:flutter/material.dart';

class AddElementScreen extends StatelessWidget {
  static String id = "add_list_screen";
  String newElement;
  final Function(String name) addNewElementCallback;

  AddElementScreen({this.addNewElementCallback});

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
            addNewElementCallback(newElement);
            Navigator.pop(context);
          }, child: Text("Add"),)
        ],
      ),
    );
  }
}
