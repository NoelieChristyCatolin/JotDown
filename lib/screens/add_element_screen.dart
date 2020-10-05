import 'package:flutter/material.dart';

class AddElementScreen extends StatelessWidget {
  static String id = "add_list_screen";
  String newList;
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
          Text("Add New List"),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value){
              // TODO:  add update string action
              newList = value;
            },
          ),
          FlatButton(onPressed: () {
            // TODO: Add list action
            addNewElementCallback(newList);
            Navigator.pop(context);
          }, child: Text("Add"),)
        ],
      ),
    );
  }
}
