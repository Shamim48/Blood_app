import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_resources.dart';
import 'home_paage.dart';
import 'search_page.dart';


class Navigation_Page extends StatefulWidget {
  const Navigation_Page({Key? key}) : super(key: key);

  @override
  _Navigation_PageState createState() => _Navigation_PageState();
}

class _Navigation_PageState extends State<Navigation_Page> {
  @override
  final Pages = [

    HomePage(),
    SearchPage(),


  ];

  var _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: ColorResources.COLOR_PRIMARY,
        buttonBackgroundColor: ColorResources.COLOR_PRIMARY,
        backgroundColor: Colors.white,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 700),

        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: const [
          Icon(
            Icons.assignment_ind_outlined, color: Colors.white,
          ),
          Icon(
            Icons.home_outlined, color: Colors.white,
          ),
          Icon(
            Icons.search, color: Colors.white,
          ),
          Icon(Icons.person, color: Colors.white,),
          Icon(
            Icons.add_box_outlined, color: Colors.white,
          ),

        ],
      ),
      body: Pages[_page],
    );
  }
}