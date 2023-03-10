
import 'package:blood_app/screen/about_donation.dart';
import 'package:blood_app/screen/activity_post_ListPage.dart';
import 'package:blood_app/screen/blood_post_listpage.dart';
import 'package:blood_app/screen/communication.dart';

import 'package:blood_app/screen/profile.dart';
import 'package:blood_app/screen/search_page.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color_resources.dart';
import 'end_Drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var _scaffoldkey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {
  List imagelist = [
    {"id": 1, "image_path": "assets/images/blood_carousel1.jpg"},
    {"id": 2, "image_path": "assets/images/blood_carousel2l.jpg"},
    {"id": 3, "image_path": "assets/images/blood_pi1.jpg"},
    {"id": 4, "image_path": "assets/images/blood_gi1.jpg"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          backgroundColor: Colors.white,
        leading: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              child: Image.asset(
                "assets/images/fci_blood_donation_logo.png",fit: BoxFit.cover,
              ),
            ),
          ),
        ),
          leadingWidth: 80,
          toolbarHeight: 80,
          title: const Text("FCI BLOOD BANK",style: TextStyle(fontWeight: FontWeight.bold,color: ColorResources.BLOOD_COLOR,fontSize: 25),),
          centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              _scaffoldkey.currentState?.openEndDrawer();
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/images/menus.png",
                  color: ColorResources.COLOR_PRIMARY,
                ),
              ),
            ),
          ),
        ],
      ),
        endDrawer: CustomEndDrawer(),
        backgroundColor: ColorResources.WHITE,
        body: ListView(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                const SizedBox(height: 15,),
// ...............................Carousel Slider.......................
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(currentIndex);
                        },
                        child: CarouselSlider(
                          items: imagelist
                              .map((item) => Image.asset(
                            item['image_path'],
                            width: double.infinity,
                          ))
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2.1,
                              viewportFraction: 1,
                              onPageChanged: ((index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              })),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imagelist.asMap().entries.map((entry) {
                            print(entry);
                            print(entry.key);
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentIndex == entry.key ? 17 : 7,
                                height: 7.0,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: currentIndex == entry.key
                                        ? ColorResources.COLOR_PRIMARY
                                        : Colors.teal),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),

                //........................Shadow and GridView....................
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                  child: Container(
                    height: 280,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 3,
                            color: ColorResources.COLOR_PRIMARY,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing:30,
                        children:[
                        
                          Custom_Gridview(image: Image.asset("assets/images/magnifying-glass.png"), title: "Search", onTab: () => SearchPage()),
                          Custom_Gridview(image: Image.asset("assets/images/pen.png"), title: "Request", onTab: () => BloodPostListPage()),
                          Custom_Gridview(image: Image.asset("assets/images/account.png"), title: "Profile", onTab: () => Profile(isDonner: false,donnerPhone: FirebaseAuth.instance.currentUser!.phoneNumber,)),
                          Custom_Gridview(image: Image.asset("assets/images/juggler.png"), title: "Activities", onTab: () => ActivityPostListPage()),
                          Custom_Gridview(image: Image.asset("assets/images/support.png"), title: "Contact", onTab: () => Communication()),
                          Custom_Gridview(image: Image.asset("assets/images/information-button.png"), title: "About", onTab: () => AboutDonation()),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
