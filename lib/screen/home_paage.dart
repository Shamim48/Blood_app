
import 'package:blood_app/screen/blood_post_listpage.dart';

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
    {"id": 1, "image_path": "assets/images/Donor-PNG-Image1.png"},
    {"id": 2, "image_path": "assets/images/Donor-PNG-HD2.png"},
    {"id": 3, "image_path": "assets/images/Donor-PNG-Photos2.png"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        endDrawer: CustomEndDrawer(),
        backgroundColor: ColorResources.WHITE,
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 60,
                            width: 60,
                            child: Image.asset(
                              "assets/images/blood-drop.png",
                            )),
                      ),
                      Container(
                        child: Expanded(
                          child: Container(
                            height: 45,
                            width: 100,
                            child: const Center(
                                child: Text(
                                  "FCI Blood Bank",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),

                      //...........................Custom Drawer........................
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: InkWell(
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
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    "assets/images/menu-bar.png",
                                    color: ColorResources.COLOR_PRIMARY,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
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
                        bottom: 10,
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
                                margin: EdgeInsets.symmetric(horizontal: 3),
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
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 70),
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
                        crossAxisSpacing: 7,
                        mainAxisSpacing:30,
                        children:[
                          Custom_Gridview(image: Image.asset("assets/images/paper.png"), title: "Blood Search", onTab: () => SearchPage()),

                          Custom_Gridview(image: Image.asset("assets/images/blood.png"), title: "Blood Request", onTab: () => BloodPostListPage()),

                          Custom_Gridview(image: Image.asset("assets/images/blood.png"), title: "Blood Request", onTab: () => SearchPage()),

                          Custom_Gridview(image: Image.asset("assets/images/user.png"), title: "Profile", onTab: () => Profile()),
                          Custom_Gridview(image: Image.asset("assets/images/water-drop.png"), title: "Activities", onTab: () => SearchPage()),
                          Custom_Gridview(image: Image.asset("assets/images/communication.png"), title: "Communication", onTab: () => SearchPage()),
                          Custom_Gridview(image: Image.asset("assets/images/info.png"), title: "Info", onTab: () => SearchPage()),
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
