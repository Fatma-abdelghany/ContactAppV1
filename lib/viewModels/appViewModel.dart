
import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../views/contactsList.dart';
class AppViewModel extends ChangeNotifier{

  List<Contact> contactList=<Contact>[];

  void addContact(Contact contact,BuildContext context ){
    contactList.add(contact);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>ContactList())
      //MaterialPageRoute(builder: (context)=>AppBarWithSearch())
    );
    notifyListeners();

  }
  void updateContact(Contact contact,BuildContext context,int index ){
    contactList[index]=contact;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>ContactList())
      //MaterialPageRoute(builder: (context)=>AppBarWithSearch())
    );
    notifyListeners();

  }

  Contact getContactBYIndex(int index){
    return contactList[index];

  }

  int get numContacts=>contactList.length;
  String getContactName(int index){
    return contactList[index].firstName;
  }
  String getContactPhone(int index){
    return contactList[index].phone;
  }
  String getContactImage(int index){
    return contactList[index].image;
  }
  void deleteContact(int index){
    contactList.removeAt(index);
    notifyListeners();
  }

}