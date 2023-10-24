import 'dart:io';

import 'package:contact_app/viewModels/appViewModel.dart';
import 'package:contact_app/views/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/contact.dart';
import '../widgets/floatingActionButton.dart';
class ContactList extends StatefulWidget {
   ContactList({super.key});


  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Widget appBarTitle =  Text("Contacts");
  Icon actionIcon =  Icon(Icons.search);
  late List<Contact> allContacts;
String? img;
String? firstLetter;
  Constants constants=Constants();


  @override
  Widget build(BuildContext context) {

    return Consumer<AppViewModel>(builder: (context,viewModel,child){

      return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            backgroundColor:constants.primaryColor ,
            title:appBarTitle,
            actions: <Widget>[
              IconButton(icon: actionIcon,
                onPressed:(){
                  setState(() {
                    if ( actionIcon.icon == Icons.search){
                      actionIcon =  Icon(Icons.close);
                      appBarTitle =  const TextField(
                        style:  TextStyle(
                          color: Colors.white,
                        ),
                        decoration:  InputDecoration(
                          prefixIcon:  Icon(Icons.search,color: Colors.white),
                          hintText: "Search...",
                          hintStyle:  TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    else {
                      this.actionIcon = new Icon(Icons.search);
                      this.appBarTitle = new Text("Contacts");
                    }
                  });
                } ,),]
        ),
        body: ListView.builder(

            itemCount: viewModel.numContacts,
            itemBuilder:(context,index){
              print("XXXXXXXXX${viewModel.getContactImage(index)}");
             // getImage(viewModel,index);
              return ListTile(

                leading: setProfileImage(viewModel, index),

               // ( viewModel.getContactImage(index).toString() != "null" ) ?
               // // Text("yes ${viewModel.getContactImage(index).toString()}") : Text("no"),
               //  CircleAvatar(
               //    radius:35,
               //    backgroundImage:FileImage(File( viewModel.getContactImage(index) )) ,
               //  ):
               //  CircleAvatar(
               //    radius:35,
               //    backgroundColor: constants.primaryColor,
               //   // child: Text(viewModel.getContactName(index)[0],style: TextStyle(fontSize: 22,color: Colors.white),),
               //    child: Text(viewModel.getContactName(index)[0],style: TextStyle(fontSize: 22,color: Colors.white),),
               //  ),
                title: Text(viewModel.getContactName(index),style: TextStyle(fontWeight:FontWeight.w700)),
                subtitle: Text(viewModel.getContactPhone(index)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>EditProfile(selectedContact: index,))
                          );
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      setState(() {
                        viewModel.deleteContact(index);
                      });
                    }, icon: Icon(Icons.delete)),

                  ],
                ),
              );
            }

        ),
        floatingActionButton: MYFloatingActionButton()
      );
    });
  }

  AppBar buildAppBarWithSearch(Constants constants) {
    return AppBar(
      centerTitle: false,
      backgroundColor:constants.primaryColor ,
      title:Text("Contacts") ,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {  },
            icon: Icon(Icons.search),
          )
        )
      ],
    );
  }



Widget setProfileImage(AppViewModel viewModel,int index){
 return ( viewModel.getContactImage(index).toString() != "null" ) ?
  // Text("yes ${viewModel.getContactImage(index).toString()}") : Text("no"),
  CircleAvatar(
    radius:35,
    backgroundImage:FileImage(File( viewModel.getContactImage(index) )) ,
  ):
  CircleAvatar(
    radius:35,
    backgroundColor: constants.primaryColor,
    // child: Text(viewModel.getContactName(index)[0],style: TextStyle(fontSize: 22,color: Colors.white),),
    child: Text(viewModel.getContactName(index)[0].toUpperCase(),style: TextStyle(fontSize: 22,color: Colors.white),),
  )

  ;
}
}
