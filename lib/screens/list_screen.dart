import 'package:flutter/material.dart';
import 'package:jot_down/screens/add_list_screen.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:jot_down/models/jot_list.dart';

class ListScreen extends StatefulWidget {
  static String id = "list_screen";

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<JotList> lists = [JotList(name: "kare-kare", elements: ["pork, nuts"])];

  @override
  Widget build(BuildContext context) {

    setState(() {

    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Jot Down")
      ),
      backgroundColor: Colors.white,
      body: Container(
        child:  ListView.builder(itemBuilder: (context, index){
          bool isChecked = true;
          bool isVisible = true;
          return ListTile(
            leading: Text(
              lists[index].name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
            trailing: Checkbox(
              value: isChecked,
              onChanged: (value){
                setState(() {
                  print(value);
                  isChecked = value;
                });
              },
            ),
            onLongPress: (){
              setState(() {
                print("isVisible: ${isVisible}");
                isVisible = true;
              });
            },
            onTap: (){
              Navigator.pushNamed(context, ElementsScreen.id,arguments: ElementsScreen(list: lists[index]));
            },
          );
        },
        itemCount: lists.length,)
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=> AddListScreen());
        },
      ),
    );
  }
}
