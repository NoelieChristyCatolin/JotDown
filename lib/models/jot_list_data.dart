import 'package:flutter/foundation.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class JotListData extends ChangeNotifier{
  final List<JotList> _list =  [JotList(name: "kare-kare", elements: ["pork, nuts"])];
  CollectionReference collection= _firestore.collection("JotList");

  int get count{
    return _list.length;
  }

  List<JotList> get list{
    return _list;
  }

  void addList(String name){
    JotList newList = JotList(name: name, elements: []);
    _list.add(newList);
    collection.add(newList.toMap());
    notifyListeners();
  }

  void addElement(String newElement, int index){
    _list[index].elements.add(newElement);
    notifyListeners();
  }


}

