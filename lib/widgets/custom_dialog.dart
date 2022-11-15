import 'package:flutter/material.dart';

 class  CustomDialog{
 
 static showCustomDialog(BuildContext context, String error) async{
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(error),
        );
      }
    );
 
  }
}