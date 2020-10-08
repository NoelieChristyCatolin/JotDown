import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/element_utility_screen.dart';
import 'package:provider/provider.dart';

class ElementsScreen extends StatelessWidget{
  static String id = "elements_screen";
  int index;
  JotList jotList;
  ElementsScreen({this.index,this.jotList});

  @override
  Widget build(BuildContext context) {
    final ElementsScreen args = ModalRoute.of(context).settings.arguments;
    JotList list = Provider.of<JotListData>(context, listen: true).list[args.index];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          list.name,
          style: TextStyle(
            color: Colors.green
          ),
        ),
        backgroundColor: Colors.white54,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white30,
                ),
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(Provider.of<JotListData>(context,listen: true).list[args.index].elements[index]),
                    trailing: Wrap(
                      spacing: 15,
                      children: [
                        GestureDetector(
                          child: Icon(
                              Icons.edit,
                              color: Colors.lightBlue,
                          ),
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context)=> ElementUtilityScreen(
                              elementCallback: (element){
                                Provider.of<JotListData>(context, listen: false).editElement(element, index, list);
                              },
                            ));
                          },

                        ),
                        GestureDetector(
                          child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                          ),
                          onTap: (){
                            Provider.of<JotListData>(context, listen: false).deleteElement(index, list);
                          },
                        ),
                      ],)
                  );
                },
                itemCount: Provider.of<JotListData>(context,listen: true).list[args.index].elements.length,
              ),
            ),
            FlatButton.icon(
                onPressed: (){
                  showModalBottomSheet(context: context, builder: (context)=> ElementUtilityScreen(
                    elementCallback: (element){
                      Provider.of<JotListData>(context, listen: false).addElement(element, list);
//                            Provider.of<JotListData>(context, listen: false).newElement(element, args.index);
                    },
                  ));
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                ),
                label: Text(
                    "Add Element",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                )
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}