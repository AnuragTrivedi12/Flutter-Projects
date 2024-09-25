import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonTextFormField.dart';

import '../../../Common/CommonColor.dart';
import '../../../Common/Common_TextStyle.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
        title: Text("Add Product",style: CommonTextStyle.label_20_kavoon_white,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.03,),

              Text("Add Product",style: CommonTextStyle.label_20_kavoon,),
              SizedBox(height: Get.height*0.04,),

              ///================ Product Name Field ==================///
              Text("Product Name",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Product Name", readonly: false),

              SizedBox(height: Get.height*0.02,),

              ///=============== Product Image Field =================///
              Text("Product Image",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Attach File", readonly: true,suffixicon: Icon(CupertinoIcons.link),),

              SizedBox(height: Get.height*0.02,),

              ///=============== Price Field =================///
              Text("Price",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "\$15.00", readonly: false,keyboardType: TextInputType.number,),

              SizedBox(height: Get.height*0.3,),

              ContinueElevatedButton(onPressed: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
