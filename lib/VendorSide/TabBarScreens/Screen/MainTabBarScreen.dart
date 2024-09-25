import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_SharedPreferences.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Orders/UpcomingOrders/Screen/UpcomingOrderScreen.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Product/Screen/ProductListScreen.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Service/Screen/ServiceListScreen.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Stylist/Screen/stylistListScreen.dart';

import '../../Common/CommonColor.dart';
import '../../Common/Common_TextStyle.dart';

class MainTabBarScreen extends StatefulWidget {
  String ? saloonId;
  MainTabBarScreen({super.key,required this.saloonId});

  @override
  State<MainTabBarScreen> createState() => _MainTabBarScreenState();
}

class _MainTabBarScreenState extends State<MainTabBarScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Get.height*0.11,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: common_clr,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // title: Text("Choose Service",style: CommonTextStyle.label_20_kavoon_white,),
          // centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelStyle: CommonTextStyle.TabBar_12_kavoon_400,
                unselectedLabelStyle: CommonTextStyle.TabBar_12_kavoon_400_grey,
                indicatorColor: common_clr,
                overlayColor: MaterialStateProperty.resolveWith((states) => common_clr),
                labelPadding: EdgeInsets.symmetric(horizontal: 3.0),
                dividerColor: Color(0xFFA8A8A8),
                tabs: [
                  Tab(text: "Upcoming Order",),
                  Tab(text: "Add Service",),
                  Tab(text: "Add Stylist",),
                  Tab(text: "Add Product",),
                ]
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    UpcomingOrderScreen(saloonId: widget.saloonId,),
                    ServiceListScreen(saloonId: widget.saloonId,),
                    StylistListScreen(saloonId: widget.saloonId,),
                    ProductListScreen(),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
