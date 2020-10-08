import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/services/database.dart';

class JotListData extends ChangeNotifier{
  Database db = Database();

  List<JotList> _list = [];
  List<String> tempNewElements = [];

  JotListData()  {
    loadList();
  }

  int get count{
    return _list.length;
  }

  List<JotList> get list{
    return _list;
  }

  Future loadList() async{
    _list = await db.fetchData();
    notifyListeners();
  }

  void isDone(bool isDone,JotList list){
    list.isDone = isDone;
    db.isDone(list);
    loadList();
  }

  void createList(String list) {
    JotList newList = JotList(name: list,elements: [], isDone: false);
    db.createList(newList);
    loadList();
  }

  void deleteList(JotList list) {
     db.deleteList(list);
     loadList();
  }

  void editList(String newName,JotList list) {
    list.name = newName;
     db.editList(list);
    loadList();
  }
  
  void addElement(String element, JotList list){
    list.elements.add(element);
    db.saveElements(list);
    loadList();
  }

  void editElement(String newElement, int index, JotList list){
    list.elements[index] = newElement;
     db.editElement(list);
    loadList();
  }

  void deleteElement(int index, JotList list)  {
    list.elements.removeAt(index);
    db.deleteElement(list);
    loadList();
  }

}

