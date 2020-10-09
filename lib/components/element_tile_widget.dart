import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:provider/provider.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:jot_down/screens/element_utility_screen.dart';

class ElementTileWidget extends StatelessWidget {
  const ElementTileWidget({
    Key key,
    @required this.args,
    @required this.index,
    @required this.list,
  }) : super(key: key);

  final ElementsScreen args;
  final int index;
  final JotList list;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(Provider.of<JotListData>(context,listen: true).list[args.index].elements[index]),
        onLongPress: (){
          showModalBottomSheet(context: context, builder: (context)=> ElementUtilityScreen(
            elementCallback: (element){
              Provider.of<JotListData>(context, listen: false).editElement(element, index, list);
            },
          ));
        },
        trailing: GestureDetector(
          child: Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
          onTap: (){
            Provider.of<JotListData>(context, listen: false).deleteElement(index, list);
          },
        )
    );
  }
}