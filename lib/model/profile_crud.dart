import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/model/prifile_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection("signup");

class ProfileCrud {

  static Future<Response> profileDoner({
     String? name,
     String? phone,
     String? email,
     String? last_donet_time,
     String? address,
     String? gender,
     String? blood_group,
     String? times_blood_donet,
    String? imgid,
    String? uId,

  }) async {
    Response response = Response();
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    DocumentReference documentReference = _collection.doc(phone);


    Map<String, dynamic> setdata = <String, dynamic>{
      DonnerModel.NAME: name,
      DonnerModel.PHONE: phone,
      DonnerModel.EMAIL: email,
      DonnerModel.GENDER:gender,
      DonnerModel.ADDRESS:address,
      DonnerModel.BLOOD_GROUP: blood_group,
      DonnerModel.BLOOD_DONAT_TETIME: times_blood_donet,
      DonnerModel.LAST_DONATE_TIME: last_donet_time,
      DonnerModel.IMAGE_ID:imgid,
      DonnerModel.USERID:uId,

    };


    var result = await documentReference.set(setdata).whenComplete(() {

      response.code = 200;
      response.message = 'Successfully added to the database';
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }



  static Stream<QuerySnapshot> readDoner() {
    CollectionReference readData = _collection;
    return readData.snapshots();
  }


  static Future<DocumentSnapshot> readSingleDoner({required String? id})async {
    CollectionReference notesItemCollection = _collection;
    DocumentReference documentReferencer = _collection.doc(id);
    DocumentSnapshot documentSnapshot=await documentReferencer.get();
    return documentSnapshot;
  }

}
