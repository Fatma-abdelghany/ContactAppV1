import 'package:contact_app/entities/strings_manager.dart';
import 'package:contact_app/views/addContact.dart';
import 'package:contact_app/widgets/floatingActionButton.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FirstScreen extends StatelessWidget {

   FirstScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Constants constants=Constants();
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xfffafafa) ,
        appBar: constants.buildAppBar("Contacts"),
        body:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape:BoxShape.circle
              ),
                  child:  Icon(Icons.call,color: constants.primaryColor,)
              ),
              const SizedBox(height: 20,),
              const Text(AppStrings.noContact ,style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500),),
              const SizedBox(height: 20,),
              Text(AppStrings.pleaseAddContact,style: TextStyle(fontSize: 20,color:constants.primaryColor,fontWeight:FontWeight.w800),),
            ],
          ),
        ),
        floatingActionButton: MYFloatingActionButton()
      ),
    );
  }


}
