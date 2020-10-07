import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/list_utility_screen.dart';
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
          JotList list = Provider.of<JotListData>(context, listen: true).list[index];
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
              },
            ),
            onLongPress: (){
              //TODO: define where to implement delete and update

//              Provider.of<JotListData>(context, listen: false).deleteList(list);
              showModalBottomSheet(context: context, builder: (context)=> ListUtilityScreen(listCallback: (newName){
                Provider.of<JotListData>(context, listen: false).editList(newName, list);
              },));
            },
            onTap: (){
              var list = Provider.of<JotListData>(context, listen: false).list[index];
              Navigator.pushNamed(context, ElementsScreen.id,arguments: ElementsScreen(index: index, jotList: list));
            },
          );
        },
        itemCount: Provider.of<JotListData>(context, listen: true).count,)
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=> ListUtilityScreen(listCallback: (list){
            Provider.of<JotListData>(context, listen: false).createList(list);
          },));
        },
      ),
    );
  }
}
