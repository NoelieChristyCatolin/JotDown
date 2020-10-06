import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/screens/elements_screen.dart';

class AddListScreen extends StatelessWidget {
  static String id = "add_list_screen";
  String newList;

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
              newList = value;
            },
          ),
          FlatButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, ElementsScreen.id, arguments: ElementsScreen(list: JotList(name: newList, elements: []),));

          }, child: Text("Add"),)
        ],
      ),
    );
  }
}
