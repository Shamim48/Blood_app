import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/screen/about_developer.dart';
import 'package:blood_app/screen/profile.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_app/model/profile_crud.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

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
                          child: Image.network(
                            donnerDoc[DonnerModel.IMAGE_ID],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          donnerDoc[DonnerModel.NAME],
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          donnerDoc[DonnerModel.PHONE],
                          style: const TextStyle(fontSize: 20, color: Colors.white),
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
                      "Blood group : " + donnerDoc[DonnerModel.BLOOD_GROUP],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.mail,
                      color: Colors.red,
                    ),
                    title: Text(
                      donnerDoc[DonnerModel.EMAIL],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Last blood donation : " + donnerDoc[DonnerModel.LAST_DONATE_TIME],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.directions_walk_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "How many times blood donate : " + donnerDoc[DonnerModel.BLOOD_DONAT_TETIME],
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
                    title: const Text(
                      "Log out",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          future: singleDonner(),
        ));
  }
}
