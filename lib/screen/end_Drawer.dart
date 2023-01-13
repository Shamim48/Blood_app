import 'dart:async';

import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/screen/about_developer.dart';
import 'package:blood_app/screen/login_screen.dart';
import 'package:blood_app/screen/profile.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_app/model/profile_crud.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  // String? id;

  String? user_Id = FirebaseAuth.instance.currentUser!.phoneNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProfileCrud.singleDonner(user_Id);
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:
        FutureBuilder(
          builder: (context , snapshort){
            try{if(snapshort.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else {
             return ListView(
                children: [
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorResources.BLOOD_COLOR, ColorResources.RED_DEEP_ONE],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            ProfileCrud.donnerDoc[DonnerModel.IMAGE_ID],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ProfileCrud.donnerDoc[DonnerModel.NAME],
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ProfileCrud.donnerDoc[DonnerModel.PHONE],
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.bloodtype_outlined,
                      color: Colors.red,

                    ),
                    title: Text(
                      "Blood group : " + ProfileCrud.donnerDoc[DonnerModel.BLOOD_GROUP],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.mail,
                      color: Colors.red,
                    ),
                    title: Text(
                      ProfileCrud.donnerDoc[DonnerModel.EMAIL],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Last blood donation : " + ProfileCrud.donnerDoc[DonnerModel.LAST_DONATE_TIME],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.directions_walk_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "How many times blood donate : " + ProfileCrud.donnerDoc[DonnerModel.BLOOD_DONAT_TETIME],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.create_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Update donation date : ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.create_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Update profile",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.people_outlined,
                        color: Colors.red,
                      ),
                      title: InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutDeveloper(),));
                      },
                        child: const Text(
                          "About Developer",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.share_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Share",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                    ),
                    title: InkWell(onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogingPage(),));
                      EasyLoading.showSuccess("Logout Successful");
                    },
                      child: const Text(
                        "Log out",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),

                  ),
                ],
              );
            }
          }catch(e){
              print(e);
              return Center(child: CircularProgressIndicator(),);
            }
          }
         // future: singleDonner(),
        ));
  }
}
