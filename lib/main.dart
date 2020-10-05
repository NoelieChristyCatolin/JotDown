import 'package:flutter/material.dart';
import 'package:jot_down/screens/add_list_screen.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:jot_down/screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jot Down',
      initialRoute: ListScreen.id,
      routes: {
        ListScreen.id : (context) => ListScreen(),
        ElementsScreen.id : (context) => ElementsScreen(),
        AddListScreen.id : (context) => AddListScreen(),
      },
    );
  }
}
