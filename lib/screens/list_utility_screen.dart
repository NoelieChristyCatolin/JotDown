import 'package:flutter/material.dart';

class ListUtilityScreen extends StatefulWidget {
  static String id = "add_list_screen";
  final Function(String name) listCallback;

  ListUtilityScreen({this.listCallback});

  @override
  _ListUtilityScreenState createState() => _ListUtilityScreenState();
}

class _ListUtilityScreenState extends State<ListUtilityScreen> {
  String newList = '';

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
            Text("Enter List Name"),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                newList = value;
              },
            ),
            RaisedButton(
              child: Text("Set"),
              color: Colors.lightBlueAccent,
              onPressed: () {
                if (newList.isNotEmpty) {
                  widget.listCallback(newList);
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
