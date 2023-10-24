import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   TextEditingController controller;
   TextInputType? type;
   IconData? icon;
   String hint;
   bool autovalidate = false;

       FormFieldValidator<dynamic> validate;

   CustomTextField({required this.icon,required this.autovalidate,required this.controller,required this.type,required this.hint,required this.validate,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText:hint,
      ),
      validator: validate,

    );
  }
}
