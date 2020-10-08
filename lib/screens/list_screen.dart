import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/list_utility_screen.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  static String id = "list_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jot Down",
          style: TextStyle(
              color: Colors.green
          ),
        ),
        backgroundColor: Colors.white54,
      ),
      body: Container(
        child:  ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black12,
          ),
          itemBuilder: (context, index){
            JotList list = Provider.of<JotListData>(context, listen: true).list[index];
            bool isSelected = list.isDone;
            return ListTile(
              title: Text(
                Provider.of<JotListData>(context, listen: true).list[index].name,
                style: TextStyle(
                  color: isSelected ? Colors.white38 : null,
                  decoration: isSelected ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              leading: Icon(
                Icons.view_list,
                size: 30,
                color: Colors.lightBlueAccent,
              ),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.redAccent,
                  ),
                  onTap: (){
                    Provider.of<JotListData>(context, listen: false).isDone(true, list);
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      Provider.of<JotListData>(context, listen: false).deleteList(list);
                    });
                  },
              ),
              onLongPress: (){
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
        backgroundColor: Colors.green,
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