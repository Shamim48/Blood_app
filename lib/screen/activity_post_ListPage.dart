import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/model/profile_crud.dart';
import 'package:blood_app/screen/Activity_Post_Crud.dart';
import 'package:blood_app/screen/add_activity_post_page.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActivityPostListPage extends StatefulWidget {
  const ActivityPostListPage({Key? key}) : super(key: key);

  @override
  State<ActivityPostListPage> createState() => _ActivityPostListPageState();
}

class _ActivityPostListPageState extends State<ActivityPostListPage> {

  final Stream<QuerySnapshot> collectionReference=ActivityPostCrud.readActivityPost();

  getUserName(String? phone)async {
    DocumentSnapshot  donnerDoc= await  ProfileCrud.readSingleDoner(id: phone);
    return donnerDoc[DonnerModel.NAME];
  }


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

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Add_Activity_Post()), (route) => false);
        },
        label: const Text('post'),
        icon: const Icon(Icons.add),
        backgroundColor: ColorResources.BLOOD_COLOR,
      ),
      body: StreamBuilder(
      stream: collectionReference,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasData){
          return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e[ActivityPost.ACTIVITY_POST_UID], style: LatoBold.copyWith(fontSize: 18),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(e[ActivityPost.ACTIVITY_INFO], style: LatoRegular.copyWith(
                                    fontSize: 16

                                  ),),
                                ),
                                subtitle: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:<Widget> [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: MediaQuery.of(context).size.width/1.13,
                                            child: Image.network(e[ActivityPost.IMAGE_URL], fit: BoxFit.cover,)
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(e[ActivityPost.DATE] ?? "",),
                                          const SizedBox(width: 15,),
                                          Text(e[ActivityPost.TIME] ?? "",),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  );
                }).toList(),

              )
          );
        }
        return Container();
      },
    ),
      );

  }
}
