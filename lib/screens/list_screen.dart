import 'package:flutter/material.dart';
import 'package:jot_down/screens/add_list_screen.dart';
import 'package:jot_down/screens/elements_screen.dart';

class ListScreen extends StatefulWidget {
  static String id = "list_screen";

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> lists = ["pancit", "ice candy", "brownies"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jot Down")
      ),
      backgroundColor: Colors.white,
      body: Container(
        child:  ListView.builder(itemBuilder: (context, index){
          return ListTile(
            title: Text(
              lists[index],
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),

            ),
            onTap: (){
              Navigator.pushNamed(context, ElementsScreen.id);
            },
          );
        },
        itemCount: lists.length,)
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=> AddListScreen(addNewListCallback: (newList){
            setState((){
              lists.add(newList);
            });
          }),);
        },
      ),
    );
  }
}
