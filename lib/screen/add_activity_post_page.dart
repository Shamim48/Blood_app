import 'dart:io';

import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/model/profile_crud.dart';
import 'package:blood_app/screen/Activity_Post_Crud.dart';
import 'package:blood_app/screen/activity_post_ListPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class Add_Activity_Post extends StatefulWidget {
  const Add_Activity_Post({Key? key}) : super(key: key);

  @override
  State<Add_Activity_Post> createState() => _Add_Activity_PostState();
}

class _Add_Activity_PostState extends State<Add_Activity_Post> {

  String fileName="";
  File? file;
  final ImagePicker picker = ImagePicker();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  final _postactivityController = TextEditingController();

  void _chooseCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // Gallery
  void _chooseGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // Upload File
  Future uploadFile() async {
    if (file == null) return;
    DateTime dateTime = DateTime.now();
    final destination = 'files/$dateTime';

    try {
      final ref =FirebaseStorage.instance.ref(destination);
          // .child('$dateTime');
      await ref.putFile(file!).snapshotEvents.listen((event) {
        switch(event.state)  {
          case TaskState.running:
            EasyLoading.show(status: "Your Image Uploading...");
            break;
          case TaskState.success:
            EasyLoading.dismiss();
            registerPost(ref);
            break;
          case TaskState.canceled:
            EasyLoading.dismiss();
            EasyLoading.showError("Image Upload Failed");

            break;
        }
      });

    } catch (e) {
      print('error occured');
    }
  }



  final GlobalKey<FormState> _ScaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final _postActivity = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: TextFormField(
        controller: _postactivityController,
        autofocus: false,
        validator: (value){
          if(value == null || value.trim().isEmpty){
            return "This field is required";
          }
        },
        decoration:  const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Colors.black
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorResources.BLACK
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            labelText: "About Activities",
            labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );

    final UploadPost = InkWell(
      onTap: () async {
        if(file==null){
          EasyLoading.showError("Please Select Image");
          return;
        }
        if(_formkey.currentState!.validate()){
          uploadFile();
        }

        // String? signInmsg = await authenticationService.signIn(email: emailChak, password: pass);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width/1.6,
        decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
            color: Colors.deepPurple
        ),
        child: Text("Upload Post",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );



    return  Scaffold(
      backgroundColor: ColorResources.WHITE.withOpacity(0.8),

      body: ListView(
        children: [

          Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  _postActivity,
                  SizedBox(height: 10,),
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width/1.15,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorResources.BLACK, width: 3),
                      ),
                      child: file != null
                          ? Image.file(
                        file!,
                        fit: BoxFit.cover,
                      ):Container()
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width/1.15,
                    child: ElevatedButton(onPressed: () {
                      showDialog(context: context,
                          builder: (BuildContext context) {
                            return  AlertDialog(
                              title:const Text("Choose Option", style: TextStyle(
                                  fontWeight: FontWeight.w600, color: ColorResources.BLACK
                              ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _chooseCamera();
                                        Navigator.pop(context);
                                      },splashColor: ColorResources.GREEN,
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.camera_alt, color: ColorResources.Border_color,),
                                          ),
                                          Text("Camera", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),)
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _chooseGallery();
                                        Navigator.pop(context);
                                      },splashColor: ColorResources.COLOR_BLUE,
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.photo_library, color: ColorResources.GREEN,),
                                          ),
                                          Text("Gallery", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );

                          });
                    },
                        child: const Text("choose Image")),
                  ),
                  SizedBox(height: 50,),
                  UploadPost,

                ],
              ))
        ],
      ),
    );
  }



  void registerPost(var ref) async {
    String image_url = await ref.getDownloadURL();
    FirebaseAuth auth = FirebaseAuth.instance;
    String? userId = auth.currentUser!.phoneNumber;
    DocumentSnapshot  donnerDoc= await  ProfileCrud.readSingleDoner(id: userId);
    String name=donnerDoc[DonnerModel.NAME];
      var response = await ActivityPostCrud.addActivityPost(
        activity_info: _postactivityController.text,
        image_url: image_url,
        activity_post_uid: name ?? ""
      );

      if (response.code == 200) {
        EasyLoading.showSuccess("Post Added");
        /*showDialog(context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(response.message.toString()),
              );
            });*/
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ActivityPostListPage()));
      }
      else {
        EasyLoading.showError("Post Failed");
        /* showDialog(context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(response.message.toString()),
              );
            });*/
      }
      _postactivityController.clear();
    }
  }

