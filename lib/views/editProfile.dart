import 'package:contact_app/viewModels/appViewModel.dart';
import 'package:contact_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../entities/strings_manager.dart';
import '../entities/utiles.dart';
import '../models/contact.dart';
import 'dart:typed_data';
class EditProfile extends StatefulWidget {

  int selectedContact;
   EditProfile({required this.selectedContact,super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Uint8List? mySelectedImage;

  TextEditingController secondNameController=TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController companyController=TextEditingController();
  TextEditingController webController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    Constants constants=Constants();

    final addContactFormKey = GlobalKey<FormState>();






    return Consumer<AppViewModel>(builder: (context,viewModel,child){
      getContact(viewModel,widget.selectedContact);

      String firstName;
      String lastName;
      String phone;
      String email;
      String company;
      String webSite;
      Contact myContact;


      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor:constants.primaryColor ,
          title:Text(AppStrings.newContact) ,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: ()async{

                            setState(() {
                              firstName=firstNameController.text;
                              lastName=lastNameController.text;
                              phone=phoneController.text;
                              email=emailController.text;
                              company=companyController.text;
                              webSite=webController.text;

                              myContact=Contact(firstName: firstName, lastName: lastName, phone: phone, email: email, image: firstName, company: company, web:webSite);
                              viewModel.updateContact(myContact,context,widget.selectedContact);
                            });



                    // if(addContactFormKey.currentState!.validate()){
                    //   myContact=Contact(firstName: firstName, lastName: lastName, phone: phone, email: email, image: firstName);
                    //   viewModel.addContact(myContact,context);
                    //
                    // }

                    // final prefs = await SharedPreferences.getInstance();
                    // prefs.setBool('isFirstTime', false); // You might want to save this on a callback.


                  },
                  child: Text(AppStrings.save,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: constants.primaryColor,
                          shape:BoxShape.circle
                      ),
                      child: IconButton(
                        onPressed: () { selectImage(); },
                        icon: Icon(Icons.camera_alt,size: 40,color: Colors.white,),

                      ),
                    ),
                    SizedBox(height: 40,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.person,
                      controller: firstNameController,
                      type: TextInputType.text,
                      hint: AppStrings.firstNameHint,
                      validate: (FirstName){
                        if (FirstName.isEmpty||FirstName==null) {
                          return AppStrings.firstNameRequired;
                        }
                      },
                    )  ,
                    TextFormField(
                      keyboardType:TextInputType.text,
                      controller:secondNameController ,
                      validator:(v){
                        if (v!.isEmpty || v==null) {
                          return AppStrings.firstNameRequired;
                        }
                      },
                      decoration: InputDecoration(

                        hintText: "second",

                      ),


                    ),


                    SizedBox(height: 20,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.person,
                      controller: lastNameController,
                      type: TextInputType.text,
                      hint:AppStrings.lastNameHint,
                      validate: (LastName){
                        if (LastName.isEmpty||LastName==null) {
                          return AppStrings.lastNameRequired;
                        }
                      },)  ,
                    SizedBox(height: 40,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.work,
                      controller: companyController,
                      type: TextInputType.text,
                      hint: AppStrings.compHint,
                      validate: (val){

                      },
                    )  ,
                    SizedBox(height: 20,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.call,
                      controller: phoneController,
                      type: TextInputType.phone,
                      hint: AppStrings.phoneHint,
                      validate: (Phone){
                        if (Phone.isEmpty||Phone==null) {
                          return AppStrings.mobileNoIsRequired;
                        }
                      },
                    )  ,

                    SizedBox(height: 20,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.mail,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hint: AppStrings.emailHint,
                      validate: (Email){
                        if (Email.isEmpty||Email==null) {
                          return AppStrings.emailIsRequired;
                        }
                      },
                    )  ,
                    SizedBox(height: 40,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.web,
                      controller: webController,
                      type: TextInputType.text,
                      hint: AppStrings.compHint,
                      validate: (val){

                      },
                    )  ,



                  ],
                ),
              ),
            ),
          ),
        ),
      );

    }
    );
  }

  void selectImage() async{

    Uint8List img =await pickImage(ImageSource.gallery);
    setState(() {
      mySelectedImage=img;
    });
  }

  void getContact(AppViewModel viewModel, int selectedContact) {
    Contact myContact=viewModel.getContactBYIndex(selectedContact);
    firstNameController.value= TextEditingValue(text:myContact.firstName );
    lastNameController.value= TextEditingValue(text:myContact.lastName );
    phoneController.value= TextEditingValue(text:myContact.phone );
    emailController.value= TextEditingValue(text:myContact.email );
    companyController.value= TextEditingValue(text:myContact.company );
    webController.value= TextEditingValue(text:myContact.web );



  }

  void sendContact() {


  }
}
