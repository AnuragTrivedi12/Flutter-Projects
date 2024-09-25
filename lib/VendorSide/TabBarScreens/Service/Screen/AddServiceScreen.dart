import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonDropDownMenu.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonTextFormField.dart';

import '../../../Common/CommonColor.dart';
import '../../../Common/Common_TextStyle.dart';

enum Gender {men,women,both}


class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {

  Gender _selectedGender = Gender.men;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.11,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: Colors.white,)
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: common_clr,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text("Add Service",style: CommonTextStyle.label_20_kavoon_white,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Service",style: CommonTextStyle.label_20_kavoon,),
              SizedBox(height: Get.height*0.03,),

              ///=============== Service Name Field =================///
              Text("Service Name",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Service Name", readonly: false),
              SizedBox(height: Get.height*0.02,),

              ///=============== Service Image Field =================///
              Text("Service Image",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Attach File", readonly: true,suffixicon: Icon(CupertinoIcons.link),),
              SizedBox(height: Get.height*0.02,),

              ///=============== Description Field =================///
              Text("Description",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Add Description...", readonly: false,maxlines: 3,),
              SizedBox(height: Get.height*0.02,),

              ///=============== Price Field =================///
              Text("Price",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "\$15.00", readonly: false,keyboardType: TextInputType.number,),
              SizedBox(height: Get.height*0.02,),

              ///=============== Select Stylist Field =================///
              Row(
                children: [
                  Text("Stylist ",style: CommonTextStyle.label_16_kavoon,),
                  Text("(If applicable)",style: TextStyle(fontFamily: "Mulish",fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w400),),
                ],
              ),
              SizedBox(height: Get.height*0.01,),
              CommonDropdownMenu(hinttext: "Select Stylist"),
              SizedBox(height: Get.height*0.02,),

              ///=============== Select Product Field =================///
              Row(
                children: [
                  Text("Product ",style: CommonTextStyle.label_16_kavoon,),
                  Text("(If applicable)",style: TextStyle(fontFamily: "Mulish",fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w400),),
                ],
              ),
              SizedBox(height: Get.height*0.01,),
              CommonDropdownMenu(hinttext: "Select Product"),
              SizedBox(height: Get.height*0.02,),
              
              Text("Select service",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height:Get.height*0.02),

              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: common_clr,
                      focusColor: common_clr,
                      value: Gender.men,
                      groupValue: _selectedGender,
                      onChanged: (Gender? value){
                        setState(() {
                          _selectedGender = value!;
                        });
                      }
                    ),
                  ),
                  Text("Men",style: CommonTextStyle.mulish_16_w400(Colors.black),)
                ],
              ),

              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio(
                        activeColor: common_clr,
                        focusColor: common_clr,
                        value: Gender.women,
                        groupValue: _selectedGender,
                        onChanged: (Gender? value){
                          setState(() {
                            _selectedGender = value!;
                          });
                        }
                    ),
                  ),
                  Text("Women",style: CommonTextStyle.mulish_16_w400(Colors.black),)
                ],
              ),

              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio(
                        activeColor: common_clr,
                        focusColor: common_clr,
                        value: Gender.both,
                        groupValue: _selectedGender,
                        onChanged: (Gender? value){
                          setState(() {
                            _selectedGender = value!;
                          });
                        }
                    ),
                  ),
                  Text("Both",style: CommonTextStyle.mulish_16_w400(Colors.black),)
                ],
              ),

              SizedBox(height: Get.height*0.02,),

              ///=============== Select Category Field =================///
              Text("Select Category ",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonDropdownMenu(hinttext: "Category Name"),


              SizedBox(height: Get.height*0.07,),
              
              ContinueElevatedButton(onPressed: () {})

            ],
          ),
        ),
      ),
    );
  }
}

