import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonBoxDecoration.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Product/Screen/AddProductScreen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
          child: Column(
            children: [
              SizedBox(height: Get.height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonElevatedButton(onPressed: () {
                    Get.to(()=> AddProductScreen());
                  }),
                ],
              ),

              SizedBox(height: Get.height*0.03,),

              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(6, (index) {
                  return Container(
                    height: Get.height*0.22,
                    decoration: CommonBoxDecoration.roundCornder_shadowBox,
                    child: Column(
                      children: [
                        Container(
                          height: Get.height*0.1,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                            ),
                            image: DecorationImage(image: AssetImage("assets/images/beauty_products.png"),fit: BoxFit.fitWidth)
                          ),
                        ),
                        SizedBox(height: Get.height*0.01,),
                        Container(
                          width: Get.width*0.4,
                          child: Text("Bobbi brown makeup package",textAlign: TextAlign.center,style: CommonTextStyle.label_15_kavoon_400.copyWith(color: Color(0xFF666565)))
                        ),

                        SizedBox(height: Get.height*0.01,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: Get.width*0.02,),
                            Text("\$15.00",style: CommonTextStyle.mulish_20_w700(Colors.black),)
                          ],
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
