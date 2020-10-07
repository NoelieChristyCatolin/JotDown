import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jot_down/models/jot_list.dart';

final _firestore = FirebaseFirestore.instance;
final collectionName = "JotList";

class JotListData extends ChangeNotifier{

  List<JotList> _list = [];

  JotListData()  {
      fetchData().then((value) {
        _list = value;
        notifyListeners();
      });
  }

  int get count{
    return _list.length;
  }

  List<JotList> get list{
    return _list;
  }

  void createList(String list) {
    JotList newList = JotList(name: list,elements: []);
    _list.add(newList);
     _firestore.collection(collectionName).doc(list).set(newList.toMap());
    notifyListeners();
  }

  void deleteList(int listIndex) {
     _firestore.collection(collectionName).doc(_list[listIndex].name).delete();
    _list.removeAt(listIndex);
    notifyListeners();
  }

  void editList(String list, int listIndex) {
    var oldName = _list[listIndex].name;
    _list[listIndex].name = list;
     _firestore.collection(collectionName).doc(oldName).update(_list[listIndex].toMap());
    notifyListeners();
  }

  void addElement(String newElement, int listIndex) {
    _list[listIndex].elements.add(newElement);
     _firestore.collection(collectionName).doc(_list[listIndex].name).update(_list[listIndex].toMap());
    notifyListeners();
  }

  void editElement(String newElement, int editIndex, int listIndex){
    _list[listIndex].elements[editIndex] = newElement;
     _firestore.collection(collectionName).doc(_list[listIndex].name).update(_list[listIndex].toMap());
    notifyListeners();
  }

  void deleteElement(int deleteIndex, int listIndex)  {
    _list[listIndex].elements.removeAt(deleteIndex);
     _firestore.collection(collectionName).doc(_list[listIndex].name).update(_list[listIndex].toMap());
    notifyListeners();
  }

  List<String> toListString(List<dynamic> list) {
    List<String> newList = [];
    list.forEach((element) {
        newList.add(element);
    });
    return newList;
  }

  Future<List<JotList>> fetchData() async{
    List<JotList> list =[];
     await _firestore.collection(collectionName)
        .get()
        .then((QuerySnapshot querySnapshot) =>  {
          querySnapshot.docs.forEach((doc) {
            list.add(JotList(name:doc.data()['name'] , elements: toListString(doc.data()['elements'])));
          })

        });
    return list;

  }

}

