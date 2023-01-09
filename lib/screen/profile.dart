import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLuncher;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_app/model/profile_crud.dart';
class pofile extends StatefulWidget {
  const pofile({Key? key}) : super(key: key);

  @override
  State<pofile> createState() => _pofileState();
}

class _pofileState extends State<pofile> {

  //String? id;

  String? user_Id = FirebaseAuth.instance.currentUser!.phoneNumber;
  late DocumentSnapshot donnerDoc;
  singleDonner()async{
    donnerDoc= await  ProfileCrud.readSingleDoner(id: user_Id);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleDonner();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            //---------------------Picture---------
            Stack(
              children:[
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_PRIMARY,
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 85,left: 30),
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white,width: 3,),
                            color: Colors.black,
                            image: DecorationImage(
                              image: NetworkImage( donnerDoc[DonnerModel.IMAGE_ID],),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75,left: 20),
                      child: Text(donnerDoc[DonnerModel.NAME],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),

            //-------------------------call messege mail whatapp -------------

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 25),),
                    Text(donnerDoc[DonnerModel.BLOOD_GROUP],style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),SizedBox(width: 15,),
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.black,
                ),SizedBox(width: 15,),
                Column(
                  children: [
                    Text("Donate Times",style: TextStyle(color: Colors.black,fontSize: 25),),
                    Text(donnerDoc[DonnerModel.BLOOD_DONAT_TETIME],style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30,),
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
                    Text("Call",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: (){
                        _makesms(donnerDoc[DonnerModel.PHONE]);
                      }, icon: Image.asset('assets/images/message.png'),
                    ),
                    Text("Message",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Icon(
                Icons.smartphone_outlined,
              ),
              title: Text("Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Text(donnerDoc[DonnerModel.PHONE],style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
              ),
              title: Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Text(donnerDoc[DonnerModel.EMAIL],style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              leading: Icon(
                Icons.place_outlined,
              ),
              title: Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Text(donnerDoc[DonnerModel.ADDRESS],style: TextStyle(fontSize: 16)),
            ),ListTile(
              leading: Icon(
                Icons.date_range_outlined,
              ),
              title: Text("Last Donate",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Text(donnerDoc[DonnerModel.LAST_DONATE_TIME],style: TextStyle(fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}

Future <void> _makecall (String phone) async {
  final Uri lunchuri = Uri(
      scheme: 'tel',
      path: '+88${phone}'
  );
  await UrlLuncher.launchUrl(lunchuri);
}

Future <void> _makesms (String message) async{
  final Uri lunchuri = Uri(
    scheme: 'sms',
    path: '+88${message}',
  );
  await UrlLuncher.launchUrl(lunchuri);
}