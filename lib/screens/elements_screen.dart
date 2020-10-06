import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/add_element_screen.dart';
import 'package:provider/provider.dart';

class ElementsScreen extends StatefulWidget {
  static String id = "elements_screen";

  int index;
  List<JotList> lists = [];


  ElementsScreen({this.index});

  @override
  _ElementsScreenState createState() => _ElementsScreenState();
}

class _ElementsScreenState extends State<ElementsScreen> {

  @override
  Widget build(BuildContext context) {
    final ElementsScreen args = ModalRoute.of(context).settings.arguments;
//    JotList list = Provider.of<JotListData>(context,listen: true).list[args.index];
    return Scaffold(
      appBar: AppBar(
          title: Text(Provider.of<JotListData>(context,listen: true).list[args.index].name + "(${Provider.of<JotListData>(context,listen: true).list[args.index].elements.length})"),
//        leading: FlatButton(
//          child: Text("Delete"),
//          onPressed: (){
//              //add delete
//          },
//        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index){
                  bool isChecked = false;
                  return ListTile(
                    title: Text(Provider.of<JotListData>(context,listen: true).list[args.index].elements[index]),
                    trailing: Checkbox(
                      value: isChecked,
                      onChanged: (value){
//                      setState(() {
//                        print(value);
//                        isChecked = value;
//                      });
                      },
                      activeColor: Colors.lightBlueAccent,
                    ),


                  );
                },
                itemCount: Provider.of<JotListData>(context,listen: true).list[args.index].elements.length,
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      showModalBottomSheet(context: context, builder: (context)=> AddElementScreen(
                        addNewElementCallback: (newElement){
                          Provider.of<JotListData>(context, listen: false).addElement(newElement, args.index);
                        },
                      ));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add Element")
                ),
                FlatButton.icon(
                    onPressed: (){
                      //todo pass data. probably change to provider
                      print("success");
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.save),
                    label: Text("Save")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
