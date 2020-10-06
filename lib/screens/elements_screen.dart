import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/screens/add_element_screen.dart';
import 'package:jot_down/screens/add_list_screen.dart';
import 'package:jot_down/screens/list_screen.dart';

class ElementsScreen extends StatefulWidget {
  static String id = "elements_screen";
  JotList list;
  final Function(JotList newList) addNewJotListCallback;

  ElementsScreen({this.list, this.addNewJotListCallback});

  @override
  _ElementsScreenState createState() => _ElementsScreenState();
}

class _ElementsScreenState extends State<ElementsScreen> {

  @override
  Widget build(BuildContext context) {
    final ElementsScreen args = ModalRoute.of(context).settings.arguments;
    widget.list = args.list;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.list.name + "(${widget.list.elements.length})"),
        leading: FlatButton(
          child: Text("Delete"),
          onPressed: (){
              //add delete
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index){
                  bool isChecked = false;
                  return ListTile(
                    title: Text(widget.list.elements[index]),
                    trailing: Checkbox(
                      value: isChecked,
                      onChanged: (value){
                      setState(() {
                        print(value);
                        isChecked = value;
                      });
                      },
                      activeColor: Colors.lightBlueAccent,
                    ),


                  );
                },
                itemCount: widget.list.elements.length,
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      showModalBottomSheet(context: context, builder: (context)=> AddElementScreen(
                        addNewElementCallback: (newElement){
                          setState(() {
                            widget.list.elements.add(newElement);
                          });
                        },
                      ));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add Element")
                ),
                FlatButton.icon(
                    onPressed: (){
                      //todo pass data. probably change to provider
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
