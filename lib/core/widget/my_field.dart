import 'package:flutter/material.dart';
import 'package:sa7ty/core/constant/enum.dart';

class my_field extends StatelessWidget {
  const my_field({
    super.key,
    required this.hintText,
    this.oneline = true, required this.controller,  this.type, this.keyboardType,
  });

  final String hintText;
  final bool oneline;
  final TextEditingController controller;
  final fieldtype? type;
  final TextInputType? keyboardType;
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType??TextInputType.text ,
      controller:controller ,
      maxLines: oneline ? 1 : 6,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if(type==fieldtype.inf){
          if(value!.isEmpty){
            return '*';
          }
        }else if(type==fieldtype.add){
          if(value!.isEmpty){
            return '*';
          }
        }else if(type==fieldtype.pho){
          if(value!.length<11){
            return 'اكمل الرقم';
          }
        }else{
          return null;
        }
      },
    );
  }
}
