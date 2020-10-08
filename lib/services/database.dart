import 'package:jot_down/models/jot_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  final _firestore = FirebaseFirestore.instance;
  final collectionName = "JotList";

  Future<List<JotList>> fetchData() async{
    List<JotList> list =[];
    await _firestore.collection(collectionName)
        .get()
        .then((QuerySnapshot querySnapshot) =>  {
      querySnapshot.docs.forEach((doc) {
        list.add(JotList(id: doc.id ,name:doc.data()['name'] , elements: toListString(doc.data()['elements']), isDone: doc.data()['isDone'] ));
      })
    });
    return list;
  }
  void isDone(JotList list){
    _firestore.collection(collectionName).doc(list.id).update(list.toMap());
  }

  void createList(JotList list) {
    _firestore.collection(collectionName).add(list.toMap());
  }

  void deleteList(JotList list) {
    _firestore.collection(collectionName).doc(list.id).delete();
  }

  void editList(JotList list) {
    _firestore.collection(collectionName).doc(list.id).update(list.toMap());

  }

  void saveElements(JotList list) {
    _firestore.collection(collectionName).doc(list.id).update(list.toMap());
  }

  void editElement(JotList list){
    _firestore.collection(collectionName).doc(list.id).update(list.toMap());
  }

  void deleteElement(JotList list)  {
    _firestore.collection(collectionName).doc(list.id).update(list.toMap());
  }

  List<String> toListString(List<dynamic> list) {
    List<String> newList = [];
    list.forEach((element) {
      newList.add(element);
    });
    return newList;
  }
}