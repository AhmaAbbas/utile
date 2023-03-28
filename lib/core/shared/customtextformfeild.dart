import 'package:flutter/material.dart';

import '../utls/constants.dart';



class Custom_Textformfeild extends StatelessWidget {
  Custom_Textformfeild(
      {this.label_text, this.icon, this.onchaged, this.validator,this.textInputType,this.onTap,
        this.obsecure = false,this.maxlines=1, this.onSaved,this.textEditingController
      });
  String? Function(String?)? validator;
  String? label_text;
  IconData? icon;
  TextEditingController? textEditingController;
  void Function()? onTap;
  Function(String)? onchaged;
  void Function(String?)? onSaved;
  bool? obsecure;
  int? maxlines;
  TextInputType? textInputType;
  //Function(String)? validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: textInputType!,
        onSaved:onSaved,
        textAlign: TextAlign.left,
        maxLines:maxlines,
        obscureText: obsecure!,
        validator: validator,
        onChanged: onchaged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kprimaarycolor),
            ),
            labelText: label_text,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey)),
            prefixIcon: IconButton(
              icon: Icon(icon),
              color: Colors.black,
              onPressed: onTap,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
