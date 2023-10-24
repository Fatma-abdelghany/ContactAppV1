import 'package:contact_app/views/addContactWithImg.dart';
import 'package:flutter/material.dart';

import '../views/addContact.dart';
class MYFloatingActionButton extends StatelessWidget {
  const MYFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
           // MaterialPageRoute(builder: (context)=>AddContact())
            MaterialPageRoute(builder: (context)=>AddContactWithImg())
        );
      },
      child: Icon(Icons.add),
      backgroundColor:Color(0xff3f51b5) ,

    );
  }
}
