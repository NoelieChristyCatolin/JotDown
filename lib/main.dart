import 'package:flutter/material.dart';
import 'package:jot_down/models/jot_list_data.dart';
import 'package:jot_down/screens/list_utility_screen.dart';
import 'package:jot_down/screens/elements_screen.dart';
import 'package:jot_down/screens/list_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JotListData(),
      child: MaterialApp(
        title: 'Jot Down',
        theme: ThemeData.light(),
        initialRoute: ListScreen.id,
        routes: {
          ListScreen.id : (context) => ListScreen(),
          ElementsScreen.id : (context) => ElementsScreen(),
          ListUtilityScreen.id : (context) => ListUtilityScreen(),
        },
      ),
    );
  }
}
