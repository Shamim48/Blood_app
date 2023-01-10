
import 'package:blood_app/screen/about_donation.dart';
import 'package:blood_app/screen/activity_post_ListPage.dart';
import 'package:blood_app/screen/blood_post_listpage.dart';
import 'package:blood_app/screen/home_paage.dart';
import 'package:blood_app/screen/search_page.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late String title="Drawer and Bottom Nav";

  late PageController _pageController;
  int _pageIndex=1;
  late List<Widget> _screenList;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey=GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(initialPage: 2);
    _screenList=[
      SearchPage(),
      ActivityPostListPage(),
      HomePage(),
      BloodPostListPage(),
      AboutDonation(),


    ];
  }
  _setPage(int index){
    setState(() {
      _pageController.jumpToPage(index);
      _pageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: const BoxDecoration(
            color: ColorResources.BLOOD_COLOR,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        child: Row(
          children: [
            BottomNavItem(icon: Icons.search_off, isSelect: _pageIndex==0, onTap:()=> _setPage(0)),
            BottomNavItem(icon: Icons.local_activity, isSelect: _pageIndex==1, onTap:()=> _setPage(1)),
            BottomNavItem(icon: Icons.home, isSelect: _pageIndex==2, onTap:()=> _setPage(2)),
            BottomNavItem(icon: Icons.edit, isSelect: _pageIndex==3, onTap:()=> _setPage(3)),
            BottomNavItem(icon: Icons.info, isSelect: _pageIndex==4, onTap:()=> _setPage(4)),

          ],
        )
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _screenList.length,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index){
            return _screenList[index];
          }),
    );
  }
}
class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelect;
  late Function() onTap;


  BottomNavItem({required this.icon, required this.isSelect, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap: (){
        onTap();
      },
      child: Icon(icon,color: Colors.white,),
      /* Image.asset(
        image,
        width: isSelect ? 45:35,
        height: isSelect ? 45:35,
      ),*/
    ));
  }
}

