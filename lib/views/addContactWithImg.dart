import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../entities/strings_manager.dart';
import '../models/contact.dart';
import '../viewModels/appViewModel.dart';
import '../widgets/customTextField.dart';


class AddContactWithImg extends StatefulWidget {
  const AddContactWithImg({super.key});

  @override
  State<AddContactWithImg> createState() => _AddContactWithImgState();
}

class _AddContactWithImgState extends State<AddContactWithImg> {

  XFile? _imageFile;
  String? profileImagepath;
  String _errorMessage = '';


  final ImagePicker _picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();

    final myFormKey = GlobalKey<FormState>();

    TextEditingController secondNameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController companyController = TextEditingController();
    TextEditingController webController = TextEditingController();

    String firstName;
    String lastName;
    String phone;
    String email;
    String company;
    String webSite;


    Contact myContact;

    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: constants.primaryColor,
          title: Text(AppStrings.newContact),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () async {
                    firstName = firstNameController.text;
                    lastName = lastNameController.text;
                    phone = phoneController.text;
                    email = emailController.text;
                    company = companyController.text;
                    webSite = webController.text;

                    //print("===============$profileImagepath");

                    // if(_imageFile==null){profileImagepath=firstName[0];}

                    // myContact=Contact(firstName: firstName, lastName: lastName, phone: phone, email: email, image:profileImagepath.toString(), company: company, web:webSite);
                    // viewModel.addContact(myContact,context);

                    if (myFormKey.currentState!.validate()) {
                      myContact=Contact(firstName: firstName, lastName: lastName, phone: phone, email: email, image:profileImagepath.toString(), company: company, web:webSite);
                      viewModel.addContact(myContact,context);

                      print("yes$firstName");
                    } else {
                      print("nooo$firstName");
                    }

                    // final prefs = await SharedPreferences.getInstance();
                    // prefs.setBool('isFirstTime', false); // You might want to save this on a callback.


                  },
                  child: Text(AppStrings.save, style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: myFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _imageFile != null ?
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: FileImage(File(_imageFile!.path)),
                    ) :
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: constants.primaryColor,
                          shape: BoxShape.circle
                      ),
                      child: IconButton(
                        onPressed: () {
                          mySelectImage();
                        },
                        icon: Icon(
                          Icons.camera_alt, size: 40, color: Colors.white,),

                      ),
                    ),

                    SizedBox(height: 40,),
                    CustomTextField(
                      icon: Icons.person,
                      autovalidate: true,
                      controller: firstNameController,
                      type: TextInputType.text,
                      hint: AppStrings.firstNameHint,
                      validate: (v) {
                        if (v!.isEmpty || v == null) {
                          return AppStrings.firstNameRequired;
                        }
                      },
                    ),


                    SizedBox(height: 20,),
                    CustomTextField(
                        icon: Icons.person,
                        autovalidate: false,
                        controller: lastNameController,
                        type: TextInputType.text,
                        hint: AppStrings.lastNameHint,
                        validate: (v) {}),
                    SizedBox(height: 40,),
                    CustomTextField(
                      autovalidate: false,
                      icon: Icons.work,
                      controller: companyController,
                      type: TextInputType.text,
                      hint: AppStrings.compHint,
                      validate: (val) {

                      },
                    ),
                    SizedBox(height: 20,),
                    CustomTextField(
                      autovalidate: true,
                      icon: Icons.call,
                      controller: phoneController,
                      type: TextInputType.phone,
                      hint: AppStrings.phoneHint,
                      validate: (Phone) {
                        if (Phone.isEmpty || Phone == null) {
                          return AppStrings.mobileNoIsRequired;
                        }
                      },
                    ),

                    SizedBox(height: 20,),

                    CustomTextField(
                      icon: Icons.mail,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hint: AppStrings.emailHint,
                      autovalidate: true,
                      validate: (Email) {
                        // if (Email.isEmpty || Email == null) {
                        //   Email.isValidEmail() ? null : "Check your email";
                        // }
                      },
                    ),
                    SizedBox(height: 40,),
                    CustomTextField(
                      autovalidate: false,
                      icon: Icons.web,
                      controller: webController,
                      type: TextInputType.text,
                      hint: AppStrings.webHint,
                      validate: (val) {

                      },
                    ),


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

  void mySelectImage() async {
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = pickedFile;
      profileImagepath = _imageFile!.path;
    });
  }


}

// void validateEmail(String val) {
//   if(val.isEmpty){
//     setState(() {
//       _errorMessage = "Email can not be empty";
//     });
//   }else if(!EmailValidator.validate(val, true)){
//     setState(() {
//       _errorMessage = "Invalid Email Address";
//     });
//   }else{
//     setState(() {
//
//       _errorMessage = "";
//     });
//   }
// }
// }