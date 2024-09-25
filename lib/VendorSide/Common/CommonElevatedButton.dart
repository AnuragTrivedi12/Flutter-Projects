import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';

class CommonElevatedButton extends StatelessWidget {
  // const CommonElevatedButton({super.key});

  final VoidCallback onPressed;

  CommonElevatedButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: common_clr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        minimumSize: Size(80,40)
      ),
      child: Row(
        children: [
          Text("Add",style: CommonTextStyle.label_18_kavoon_white,),
          SizedBox(width: Get.width*0.01,),
          Icon(Icons.add_circle_outline,color: Colors.white,),
        ],
      )
    );
  }
}

class ContinueElevatedButton extends StatelessWidget {
  // const ContinueElevatedButton({super.key});

  final VoidCallback onPressed;

  ContinueElevatedButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,

        minimumSize: Size(500,50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: common_clr),
        )
      ),
      onPressed: onPressed,
      child: Text("Continue",style: CommonTextStyle.mulish_20_w700(common_clr),),
    );
  }
}

