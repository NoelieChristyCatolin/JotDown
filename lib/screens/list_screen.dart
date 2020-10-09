import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/list_utility_screen.dart';
import 'package:jot_down/components/list_tile_widget.dart';
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
        child:  ListView.builder(
          itemBuilder: (context, index){
            JotList list = Provider.of<JotListData>(context, listen: true).list[index];
            bool isSelected = list.isDone;
            return ListTileWidget(isSelected: isSelected, list: list, index: index);
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
