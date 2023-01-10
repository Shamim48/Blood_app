import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_app/model/profile_crud.dart';

class CustomEndDrawer extends StatefulWidget {
  CustomEndDrawer({Key? key}) : super(key: key);

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  // String? id;

  String? user_Id = FirebaseAuth.instance.currentUser!.phoneNumber;
  late DocumentSnapshot donnerDoc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  singleDonner() async {
    donnerDoc = await ProfileCrud.readSingleDoner(id: user_Id);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FutureBuilder(
          builder: (context , snapshort){
            if(snapshort.connectionState==ConnectionState.done){
              return Column(
                children: [
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorResources.RED_DEEP, ColorResources.RED_DEEP_ONE],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            donnerDoc[DonnerModel.IMAGE_ID],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          donnerDoc[DonnerModel.NAME],
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          donnerDoc[DonnerModel.PHONE],
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.bloodtype_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Blood group : " + donnerDoc[DonnerModel.BLOOD_GROUP],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.red,
                    ),
                    title: Text(
                      donnerDoc[DonnerModel.EMAIL],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Last blood donation : " + donnerDoc[DonnerModel.LAST_DONATE_TIME],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.directions_walk_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "How many times blood donate : " +
                          donnerDoc[DonnerModel.BLOOD_DONAT_TETIME],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.create_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Update blood donation date : ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.create_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Update profile",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.people_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "About Developer",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.share_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Share",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Log out",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: singleDonner(),
        ));
  }
}
