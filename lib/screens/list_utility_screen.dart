import 'package:flutter/material.dart';

class ListUtilityScreen extends StatelessWidget {
  static String id = "add_list_screen";
  final Function(String name) listCallback;
  String newList;

  ListUtilityScreen({this.listCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text("Enter List Name"),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          onChanged: (value){
            newList = value;
          },
        ),
        FlatButton(onPressed: () {
          listCallback(newList);
          Navigator.pop(context);
        }, child: Text("Set"),)
      ],
    );
  }
}
