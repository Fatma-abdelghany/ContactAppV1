import 'package:contact_app/viewModels/appViewModel.dart';
import 'package:contact_app/views/contactsList.dart';
import 'package:contact_app/views/firstScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
 // const boolKey = 'isFirstTime';
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;
  runApp(
    ChangeNotifierProvider(
        create: (context)=>AppViewModel(),
      child:  MyApp(isFirstTime:isFirstTime),
    )
  );
}

class MyApp extends StatelessWidget {
   final bool isFirstTime;
   const MyApp({super.key,  required this.isFirstTime});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {


    return  MaterialApp (

      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      home: isFirstTime?FirstScreen():ContactList(),
    );
  }
}
Future<bool> checkISFirst() async{
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
   var isFirstTime = prefs.getBool(boolKey) ?? true;
  return isFirstTime;
}

