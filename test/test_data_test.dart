import 'package:flutter_test/flutter_test.dart';
import 'package:jot_down/models/jot_list.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jot_down/services/database.dart';

class MockDB extends Database{
  @override
  Future<List<JotList>> fetchData() {
    return Future.value([JotList(id: "1",name: "cake", elements: ["flour", "eggs", "salt"], isDone: false)]);
  }
}
void main() {
  var data = JotListData();
  data.db = MockDB();

//  test('fetch data',() async {
//    await data.loadList();
//    expect(data.list, isList);
//    expect(data.list.length, 1);
//  });

  test('add element', (){
    data.createList("pata");
    expect(data.list.length, 1);
  });

}