import 'package:flutter/material.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Controller/RegisterController.dart';

class GenderDropDownMenu extends StatelessWidget {
  // const GenderDropDownMenu({super.key});

  var selectedGender;

  GenderDropDownMenu({this.selectedGender});

  final RegisterController registercont_obj = RegisterController();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: "Select Gender",
        hintStyle: CommonTextStyle.hintText_15_Mulish,
        contentPadding: EdgeInsets.only(left: 40,bottom: 15,top: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: common_clr,width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: common_clr,width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: common_clr,width: 2),
          borderRadius: BorderRadius.circular(25),
        )
      ),
      value: selectedGender,
      onChanged: (value){
        selectedGender = value;
        registercont_obj.gender.text = selectedGender;
      },
      items: ['Male','Female'].map((gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(gender),
        );
      }).toList(),

    );
  }
}

class CommonDropdownMenu extends StatelessWidget {
  // const CommonDropdownMenu({super.key});

  String hinttext;


  CommonDropdownMenu({required this.hinttext});

  var selectedStylist;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: CommonTextStyle.hintText_15_Mulish,
          contentPadding: EdgeInsets.only(left: 30,bottom: 15,top: 15),
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
      value: selectedStylist,
      onChanged: (value){
        selectedStylist = value;
      },
      items: ['Daniel Santie'].map((stylist) {
        return DropdownMenuItem(
          value: stylist,
          child: Text(stylist),
        );
      }).toList(),
    );
  }
}

