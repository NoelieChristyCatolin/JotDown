import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
final collectionName = "JotList";

class JotListData extends ChangeNotifier{

  List<JotList> _list = [];

  JotListData()  {
    loadList();
  }

  int get count{
    return _list.length;
  }

  List<JotList> get list{
    return _list;
  }

  void createList(String list) {
    JotList newList = JotList(name: list,elements: []);
     _firestore.collection(collectionName).add(newList.toMap());
    loadList();
  }

  void deleteList(JotList list) {
     _firestore.collection(collectionName).doc(list.id).delete();
     loadList();
  }

  void editList(String newName,JotList list) {
    list.name = newName;
     _firestore.collection(collectionName).doc(list.id).update(list.toMap());
    loadList();
  }

  void addElement(String newElement, JotList list) {
    list.elements.add(newElement);
     _firestore.collection(collectionName).doc(list.id).update(list.toMap());
    loadList();
  }

  void editElement(String newElement, int index, JotList list){
    list.elements[index] = newElement;
     _firestore.collection(collectionName).doc(list.id).update(list.toMap());
    loadList();
  }

  void deleteElement(int index, JotList list)  {
    list.elements.removeAt(index);
    
     _firestore.collection(collectionName).doc(list.id).update(list.toMap());
    loadList();
  }

  void loadList(){
    fetchData().then((value) {
      _list = value;
      print(_list.length);
      notifyListeners();
    });
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
            list.add(JotList(id: doc.id ,name:doc.data()['name'] , elements: toListString(doc.data()['elements'])));
          })

        });
    return list;

  }

}

