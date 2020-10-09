import 'package:flutter/material.dart';

class ElementUtilityScreen extends StatelessWidget {
  static String id = "add_list_screen";
  final Function(String name) elementCallback;
  String newElement;

  ElementUtilityScreen({this.elementCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text("Enter element name"),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                newElement = value;
              },
            ),
            RaisedButton(onPressed: () {
              if (newElement.isNotEmpty) {
                elementCallback(newElement);
                Navigator.pop(context);
              }
            }, child: Text("Set"),)
          ],
        ),
      ),
    );
  }
}
