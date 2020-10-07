import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/element_utility_screen.dart';
import 'package:provider/provider.dart';

class ElementsScreen extends StatefulWidget {
  static String id = "elements_screen";
  int index;
  JotList jotList;


  ElementsScreen({this.index,this.jotList});

  @override
  _ElementsScreenState createState() => _ElementsScreenState();
}

class _ElementsScreenState extends State<ElementsScreen> {

  @override
  Widget build(BuildContext context) {
    final ElementsScreen args = ModalRoute.of(context).settings.arguments;
    JotList list = Provider.of<JotListData>(context, listen: true).list[args.index];
    widget.jotList = args.jotList;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.jotList.name),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(Provider.of<JotListData>(context,listen: true).list[args.index].elements[index]),
                    onLongPress: (){
                      Provider.of<JotListData>(context, listen: false).deleteElement(index, list);
                    },
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (context)=> ElementUtilityScreen(
                        elementCallback: (element){
                          //todo edit
                          Provider.of<JotListData>(context, listen: false).editElement(element, index, list);
                        },
                      ));
                    },
                  );
                },
                itemCount: Provider.of<JotListData>(context,listen: true).list[args.index].elements.length,
              ),

            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      showModalBottomSheet(context: context, builder: (context)=> ElementUtilityScreen(
                        elementCallback: (element){
                          Provider.of<JotListData>(context, listen: false).addElement(element, list);
                        },
                      ));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add Element")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
