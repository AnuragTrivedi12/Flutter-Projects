import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Controller/LoginController.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Controller/RegisterController.dart';
import 'package:intl/intl.dart';
import '../../Common/CommonTextFormField.dart';

class SigninSignupScreen extends StatefulWidget {
  const SigninSignupScreen({super.key});

  @override
  State<SigninSignupScreen> createState() => _SigninSignupScreenState();
}

class _SigninSignupScreenState extends State<SigninSignupScreen> {

  var selectedGender;
  int value = 1;

  var isChecked = false;

  final RegisterController registercont_obj = Get.put(RegisterController());
  final LoginController loginCont_obj = Get.put(LoginController());

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        registercont_obj.birthDate.text = DateFormat('yyyy/MM/dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              image: DecorationImage(image: value == 1 ? AssetImage("assets/images/login_image.png") : AssetImage("assets/images/signup_image.png"),
                                  fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  common_clr.withOpacity(0.3),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: value == 1 ? Get.height*0.35 : Get.height*1.1,
                            width: Get.width,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),

                    Positioned(
                      top: value == 1 ? Get.height*0.52 : Get.height*1.23,
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
                      )
                    ),

                    Positioned(
                      top: Get.height*0.305,
                      child: Container(
                        height: value == 1 ? Get.height*0.29 : Get.height*1.0,
                        width: Get.width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(4, 4),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: Get.height*0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          value = 1;
                                        });
                                      },
                                      child: Text("Sign In",style: value == 1 ? CommonTextStyle.label_20_kavoon : CommonTextStyle.label_20_kavoon_grey,)),
                                    value == 1 ?
                                    Container(
                                      width: Get.width*0.14,
                                      height: Get.height*0.004,
                                      color: common_clr,
                                    ):Container()
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          value = 2;
                                        });
                                      },
                                      child: Text("Sign Up",style: value == 2 ?CommonTextStyle.label_20_kavoon : CommonTextStyle.label_20_kavoon_grey,)),
                                    value == 2 ?
                                    Container(
                                      width: Get.width*0.14,
                                      height: Get.height*0.004,
                                      color: common_clr,
                                    ):Container()
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: Get.height*0.03,),

                            ///=================== SignIn Container ================///

                            value == 1 ?
                            SizedBox(
                              height: Get.height*0.15,
                              width: Get.width*0.9,
                              child:Column(
                                children: [
                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "Mobile Number", readonly: false,controller: loginCont_obj.mobileNumber),
                                  ),
                                  SizedBox(height: Get.height*0.03,),
                                ],
                              ),
                            )
                            :

                            ///===================== SignUp Container =================///
                            SizedBox(
                              width: Get.width*0.9,
                              child: Column(
                                children: [

                                  ///================== First Name Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "First Name", readonly: false,controller: registercont_obj.firstName,),
                                  ),

                                  ///================== Last Name Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "Last Name", readonly: false,controller: registercont_obj.lastName),
                                  ),

                                  ///================== Mobile Number Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "Mobile Number", readonly: false,controller: registercont_obj.mobileNum),
                                  ),

                                  ///================== Email Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "Email", readonly: false,controller: registercont_obj.email),
                                  ),

                                  ///================== Gender Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: DropdownButtonFormField(
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

                                    ),
                                  ),

                                  ///================== Birth Date Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(onTap: (){_selectDate();} ,readonly: true,hinttext: "Birth Date",suffixicon: Icon(Icons.calendar_month_outlined),controller: registercont_obj.birthDate),
                                  ),

                                  ///================== Pin Code Field ================///

                                  SizedBox(height: Get.height*0.03,),
                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "Pin Code", readonly: false,controller: registercont_obj.pincode),
                                  ),
                                  SizedBox(height: Get.height*0.03,),

                                  ///================== Address Field ================///

                                  SizedBox(
                                    height: Get.height*0.06,
                                    width: Get.width*0.8,
                                    child: CommonTextFormField(hinttext: "Address", readonly: false,controller: registercont_obj.address),
                                  ),

                                  SizedBox(height: Get.height*0.02,),

                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: common_clr,
                                        value: isChecked,
                                        onChanged: (bool? checkValue){
                                          setState(() {
                                            isChecked = checkValue!;
                                          });
                                        },
                                        side: BorderSide(color: common_clr),
                                      ),
                                      
                                      Text("I Accept All ",style: CommonTextStyle.termsconditions_black,),
                                      Text("Terms & Conditions ",style: CommonTextStyle.termsconditions_common_clr,),
                                      Text("and ",style: CommonTextStyle.termsconditions_black,),
                                      Text("Privacy Policy",style: CommonTextStyle.termsconditions_common_clr),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: value == 1 ? Get.height*0.52 : Get.height*1.23,
                      child: InkWell(
                        onTap: () {
                          if(value == 1){
                            loginCont_obj.loginContFun(loginCont_obj.mobileNumber.text);
                            print("login");
                          }else{
                            print("signup");
                            registercont_obj.registerContFun(
                              registercont_obj.firstName.text,
                              registercont_obj.lastName.text,
                              registercont_obj.mobileNum.text,
                              registercont_obj.email.text,
                              registercont_obj.gender.text,
                              registercont_obj.birthDate.text,
                              registercont_obj.pincode.text,
                              registercont_obj.address.text,
                            );
                          }
                        },
                        child: Obx(
                          () {
                            return Container(
                              height: Get.height*0.12,
                              width: Get.width*0.27,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: Get.width*0.2,
                                  height: Get.height*0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: common_clr,
                                    shape: BoxShape.circle,
                                  ),
                                  child: registercont_obj.loading.value
                                      ?
                                  CircularProgressIndicator(color: Colors.white,)
                                      :
                                  loginCont_obj.loading.value
                                      ?
                                  CircularProgressIndicator(color: Colors.white,)
                                      :
                                  Icon(Icons.arrow_right_alt,color: Colors.white,size: 35,),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height*0.09,
              ),
              value == 1 ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: CommonTextStyle.accountstatement_black,),
                  InkWell(
                      onTap: () {
                        setState(() {
                          value = 2;
                        });
                      },
                      child: Text("Sign Up",style: CommonTextStyle.accountstatement_common_clr,)),
                ],
              )
              :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",style: CommonTextStyle.accountstatement_black,),
                  InkWell(
                      onTap: () {
                        setState(() {
                          value = 1;
                        });
                      },
                      child: Text("Sign In",style: CommonTextStyle.accountstatement_common_clr,)),
                ],
              ),
              SizedBox(height: Get.height*0.05,),
            ],
          ),
        ),
      )
    );
  }
}
