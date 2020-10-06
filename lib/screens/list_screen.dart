import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/add_list_screen.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  static String id = "list_screen";

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
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
              Provider.of<JotListData>(context, listen: true).list[index].name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
            trailing: Checkbox(
              value: isChecked,
              onChanged: (value){
//                setState(() {
//                  print(value);
//                  isChecked = value;
//                });
              },
            ),
            onLongPress: (){
//              setState(() {
//                print("isVisible: ${isVisible}");
//                isVisible = true;
//              });
            },
            onTap: (){
              Navigator.pushNamed(context, ElementsScreen.id,arguments: ElementsScreen(index: index));
            },
          );
        },
        itemCount: Provider.of<JotListData>(context, listen: true).count,)
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
