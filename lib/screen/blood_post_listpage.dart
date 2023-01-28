
import 'package:blood_app/screen/add_blood_post_page.dart';
import 'package:blood_app/screen/blood_post_crud_operation.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLuncher;



class BloodPostListPage extends StatefulWidget {
  const BloodPostListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

var _scaffoldKey = GlobalKey<ScaffoldState>();
class _ListPage extends State<BloodPostListPage> {
  final Stream<QuerySnapshot> collectionReference = BloodPostCrud.readBloodPostRequest();
  //FirebaseFirestore.instance.collection('Employee').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddBloodPostPage(),));
          },
          backgroundColor: ColorResources.BLOOD_COLOR,
          child: const Icon(Icons.edit),
        ),
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((e) {
                return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: ColorResources.BLOOD_COLOR,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(Icons.person,color: Colors.white,)
                                ),
                                const SizedBox(width: 15,),
                                Text(e["postuName"], style: LatoBold.copyWith(fontSize: 17),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            RichText(
                                text:  TextSpan(
                                  text:"Blood group:  ",style: const TextStyle(fontSize: 16,color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: e["blood_group"],style: const TextStyle(fontSize: 16,color: ColorResources.BLOOD_COLOR,fontWeight: FontWeight.bold),
                                    )
                                  ]
                                )
                            ),
                            //Text("রক্তের গ্রুপ: " + e["blood_group"],style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Text("Patient problem:  " + e["patient_problem"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Text("Blood amount:  " + e["blood_quantity"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Text("Date & Time:  " + e["date_time"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Text("Blood donation Place:  " + e["place_where"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            RichText(
                                text:  TextSpan(
                                    text:"Patient relative number:  ",style: const TextStyle(fontSize: 16,color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: e["relative_mobile"],style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                                      )
                                    ]
                                )
                            ),
                            const SizedBox(height: 20,),
                            Text("Hemoglobin:  " + e["hemoglobin"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Text("Reference:  " + e["reference"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Text("More:  " + e["more_details"],style:const TextStyle(fontSize: 16),),
                            const SizedBox(height: 20,),
                            Center(
                              child: Container(
                                height: 70,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),

                               ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              _makePhoneCall(e["relative_mobile"] );
                                            },
                                            icon: const Icon(Icons.call,color: Colors.green,),
                                          iconSize: 30,
                                        ),
                                        const Text("Call",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              _makeSms(e["relative_mobile"]);
                                              },
                                            icon:const Icon(Icons.message,color: Colors.amber,),
                                          iconSize: 30,
                                        ),
                                        const Text("Message",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(e["date"] ?? "",style: TextStyle(fontSize: 12),),
                                 const SizedBox(width: 15,),
                                Text(e["time"] ?? "",style: TextStyle(fontSize: 12)),
                              ],
                            ),

                      ]),
                    ));
              }).toList(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri laungchUri = Uri(
    scheme: 'tel',
    path: "+88$phoneNumber",
  );
  await UrlLuncher.launchUrl(laungchUri);
}

Future<void> _makeSms(String phoneNumber) async {
  final Uri laungchUri = Uri(
    scheme: 'sms',
    path: "+88$phoneNumber",
  );
  await UrlLuncher.launchUrl(laungchUri);
}






