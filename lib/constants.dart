import 'package:flutter/material.dart';
class Constants{

    Color primaryColor=Color(0xff3f51b5);

  AppBar buildAppBar( String apptitle) {
    return AppBar(
      centerTitle: false,
      backgroundColor:primaryColor ,
      title: Text(apptitle),

    );
  }

}