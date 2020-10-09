import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:provider/provider.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:jot_down/screens/list_utility_screen.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({this.isSelected, this.list, this.index});

  final bool isSelected;
  final JotList list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Provider
                  .of<JotListData>(context, listen: true)
                  .list[index].name,
              style: TextStyle(
                color: isSelected ? Colors.white38 : null,
                decoration: isSelected ? TextDecoration.lineThrough : TextDecoration
                    .none,
              ),
            ),
            list.elements.isNotEmpty ? Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '${Provider.of<JotListData>(context, listen: true).list[index].elements.length} items',
                style: TextStyle(
                  color: isSelected ? Colors.white54 : null,
                  fontSize: 10,
                ),
              ),
            ) : SizedBox.shrink(),
          ],
        ),
        trailing: GestureDetector(
          child: Icon(
            Icons.clear,
            size: 15,
            color: Colors.redAccent,
          ),
          onTap: () {
            Provider.of<JotListData>(context, listen: false).isDone(true, list);
            Future.delayed(const Duration(milliseconds: 1500), () {
              Provider.of<JotListData>(context, listen: false).deleteList(list);
            });
          },
        ),
        onLongPress: () {
          showModalBottomSheet(context: context, builder: (context) =>
              ListUtilityScreen(listCallback: (newName) {
                Provider.of<JotListData>(context, listen: false).editList(
                    newName, list);
              },));
        },
        onTap: () {
          var list = Provider
              .of<JotListData>(context, listen: false)
              .list[index];
          Navigator.pushNamed(context, ElementsScreen.id,
              arguments: ElementsScreen(index: index, jotList: list));
        },
      ),
    );
  }
}