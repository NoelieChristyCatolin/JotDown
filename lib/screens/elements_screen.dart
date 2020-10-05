import 'package:flutter/material.dart';
import 'package:jot_down/screens/add_list_screen.dart';

class ElementsScreen extends StatefulWidget {
  static String id = "elements_screen";

  @override
  _ElementsScreenState createState() => _ElementsScreenState();
}

class _ElementsScreenState extends State<ElementsScreen> {
  final List<String> list = ["egg", "oil"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Jot Down"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(list[index]),
                );
              },
              itemCount: list.length,
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.add,
                  size: 30,
                ),
                Text("Add new Element",
                  style: TextStyle(
                      fontSize: 30
                  ),
                )
              ],
            ),
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=> AddListScreen(addNewListCallback: (newItem){
                setState(() {
                  list.add(newItem);
                });
              },));
            },
          )
        ],
      ),


    );
  }
}
