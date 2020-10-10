import 'package:flutter/material.dart';


class ElementUtilityScreen extends StatefulWidget {
  static String id = "add_list_screen";
  final Function(String name) elementCallback;

  ElementUtilityScreen({this.elementCallback});

  @override
  _ElementUtilityScreenState createState() => _ElementUtilityScreenState();
}

class _ElementUtilityScreenState extends State<ElementUtilityScreen> {
  String newElement;

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
            RaisedButton(
              child: Text("Set"),
              color: Colors.lightBlueAccent,
              onPressed: () {
                if (newElement.isNotEmpty) {
                  widget.elementCallback(newElement);
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
