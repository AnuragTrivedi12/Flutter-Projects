import 'package:flutter/material.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';

class CommonTextFormField extends StatelessWidget {
  // const CommonTextFormField({super.key});

  CommonTextFormField({required this.hinttext, this.suffixicon,required this.readonly,this.controller,this.onTap});

  String? hinttext;
  final suffixicon;
  final bool readonly;
  TextEditingController?controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: CommonTextStyle.hintText_15_Mulish,
          contentPadding: EdgeInsets.only(left: 40,bottom: 15,top: 15),
          suffixIcon: suffixicon,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFFAF7F1F),
                width: 1
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFAF7F1F),width: 1,),
            borderRadius: BorderRadius.circular(22),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFFAF7F1F),
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(22),
          )
      ),
    );
  }
}

class CommonBlackTextFormField extends StatelessWidget {
  // const CommonBlackTextFormField({super.key});

  String? hinttext;
  final suffixicon;
  final bool readonly;
  final int? maxlines;
  final TextInputType? keyboardType;
  TextEditingController?controller;


  CommonBlackTextFormField({required this.hinttext, this.suffixicon, required this.readonly,this.maxlines,this.keyboardType,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readonly,
      maxLines: maxlines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: CommonTextStyle.hintText_15_Mulish,
          contentPadding: EdgeInsets.only(left: 30,bottom: 15,top: 15),
          suffixIcon: suffixicon,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF9A8F8F),
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,),
            borderRadius: BorderRadius.circular(22),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF9A8F8F),
            ),
            borderRadius: BorderRadius.circular(22),
          )
      ),
    );
  }
}



