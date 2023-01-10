import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_app/model/profile_crud.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLuncher;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  //String? id;

  String? user_Id = FirebaseAuth.instance.currentUser!.phoneNumber;
  late DocumentSnapshot donnerDoc;
  singleDonner()async{
    donnerDoc= await  ProfileCrud.readSingleDoner(id: user_Id);
    print("User ID");
    print(user_Id);
    print("User data");
    print(donnerDoc);
    print(donnerDoc["image_url"]);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context , snapshort){
          if(snapshort.connectionState==ConnectionState.done){
            return Column(
                children: [
                  //---------------------Picture---------
                  Stack(
                    children:[
                      SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/blood_profile_background.jpg"),fit: BoxFit.fill
                            )
                        ),
                      ),
                     /* Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorResources.COLOR_PRIMARY,
                        ),
                      ),*/

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100,left: 30),
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: ColorResources.BLOOD_COLOR,width: 3,),
                                  color: Colors.black,
                                  image: DecorationImage(
                                    image: NetworkImage( donnerDoc[DonnerModel.IMAGE_ID],),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50,left: 20),
                            child: SizedBox(
                              width: 200,
                              child: Text(donnerDoc[DonnerModel.NAME],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                            )
                          ),
                        ],
                      ),
                    ],
                  ),

                  //-------------------------call messege mail whatapp -------------
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text(donnerDoc[DonnerModel.BLOOD_GROUP],style: const TextStyle(color: ColorResources.BLOOD_COLOR,fontSize: 25,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: 50,
                        width: 2,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        children: [
                          const Text("Donate Times",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text(donnerDoc[DonnerModel.BLOOD_DONAT_TETIME],style: const TextStyle(color: ColorResources.BLOOD_COLOR,fontSize: 25,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                               _makecall(donnerDoc[DonnerModel.PHONE]);
                            }, icon: Image.asset('assets/images/phone-message.png',),
                          ),
                          const Text("Call",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){
                                _makesms(donnerDoc[DonnerModel.PHONE]);
                            }, icon: Image.asset('assets/images/message.png'),
                          ),
                          const Text("Message",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  ListTile(
                    leading: const Icon(
                      Icons.smartphone_outlined,
                      color: ColorResources.BLOOD_COLOR,
                    ),
                    title: const Text("Number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    subtitle: Text(donnerDoc[DonnerModel.PHONE],style: const TextStyle(fontSize: 14)),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.email_outlined,
                      color: ColorResources.BLOOD_COLOR,

                    ),
                    title: const Text("Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    subtitle: Text(donnerDoc[DonnerModel.EMAIL],style: const TextStyle(fontSize: 14)),
                  ),

                  /* ListTile(
            leading: Icon(
              Icons.place_outlined,
            ),
            title: Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: Text(donnerDoc[DonnerModel.ADDRESS],style: TextStyle(fontSize: 16)),
          ),*/
                  ListTile(
                    leading: const Icon(
                      Icons.date_range_outlined,
                      color: ColorResources.BLOOD_COLOR,

                    ),
                    title: const Text("Last Donate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    subtitle: Text(donnerDoc[DonnerModel.LAST_DONATE_TIME],style: const TextStyle(fontSize: 14),),
                  ),
                ],
              );}else{
           return const Center(child: CircularProgressIndicator());
          }
        },
        future: singleDonner(),
      )
    );
  }
}


Future<void> _makecall(String phoneNumber) async {
  final Uri laungchUri = Uri(
    scheme: 'tel',
    path: "$phoneNumber",
  );
  await UrlLuncher.launchUrl(laungchUri);
}

Future<void> _makesms(String phoneNumber) async {
  final Uri laungchUri = Uri(
    scheme: 'sms',
    path: "$phoneNumber",
  );
  await UrlLuncher.launchUrl(laungchUri);
}

