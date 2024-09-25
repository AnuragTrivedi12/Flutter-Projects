import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Controller/OtpController.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  String ? userId;
  OtpScreen({super.key, required this.userId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final OtpController otp_obj = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: Get.width,
                    child: Column(
                      children: [
                        Container(
                          height: Get.height*0.38,
                          width: Get.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/otpscreen_image.png"),
                              fit: BoxFit.cover,
                              colorFilter:ColorFilter.mode(
                                common_clr.withOpacity(0.3),
                                BlendMode.darken,
                              )
                            )
                          ),
                        ),
                        Container(
                          height: Get.height*0.45,
                          width: Get.width,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: Get.height*0.63,
                    child: Container(
                      height: Get.height*0.12,
                      width: Get.width*0.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:const Offset(0, 5),
                              blurRadius: 8,
                              spreadRadius: 2
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: Get.height*0.305,
                    child: Container(
                      height: Get.height*0.4,
                      width: Get.width*0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(4, 4),
                            blurRadius: 8,
                            spreadRadius: 2
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height*0.05,),
                          Text("OTP Verification",style: CommonTextStyle.label_24_kavoon,),

                          SizedBox(height: Get.height*0.04,),

                          Text("We will send you a code please check your Mobile No. and enter your code",
                            textAlign: TextAlign.center,
                            style: CommonTextStyle.mulish_15_w400.copyWith(color: Color(0xFFACACAC)),
                          ),

                          SizedBox(height: Get.height*0.04,),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Pinput(
                              controller: otp_obj.otp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: Get.height*0.63,
                    child: InkWell(
                      onTap: (){
                        otp_obj.otpContFun(otp_obj.otp.text, widget.userId.toString());
                      },
                      child: Obx(
                        () {
                          return Container(
                            height: Get.height*0.12,
                            width: Get.width*0.27,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Container(
                                height: Get.height*0.2,
                                width: Get.width*0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: common_clr,
                                  shape: BoxShape.circle,
                                ),
                                child: otp_obj.loading.value ? CircularProgressIndicator(color: Colors.white,) : Icon(Icons.arrow_right_alt,color: Colors.white,size: 35,),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
