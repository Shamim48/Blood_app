
import 'package:blood_app/model/blood_post_message.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection("blood post request");

class BloodPostCrud{
  //Add User here
  static Future<BloodPostResponseMessage> addBloodRequest({
     String? bloodGroup,
     String? patientProblem,
     String? bloodQuantity,
     String? dateTime,
     String? place,
     String? relative,
     String? hemoglobin,
     String? reference,
     String? more,
    String? uiImg,
    String? postUid
  }) async {
    BloodPostResponseMessage bloodPostresponseMessage = BloodPostResponseMessage();
    DocumentReference documentReference = _Collection.doc();
    String? userId= await FirebaseAuth.instance.currentUser!.phoneNumber;
    Map<String, dynamic> data= <String, dynamic>{
      "blood_group" : bloodGroup,
      "patient_problem" : patientProblem,
      "blood_quantity" : bloodQuantity,
      "date_time" : dateTime,
      "place_where" : place,
      "relative_mobile" : relative,
      "hemoglobin" : hemoglobin,
      "reference": reference,
      "more_details" : more,
      "uIimage": uiImg,
      "postuid": userId,
      "date": getDate(),
      "time": getTime(),
    };

    var result = await documentReference.set(data)
        .whenComplete(() {
      bloodPostresponseMessage.code =200;
      bloodPostresponseMessage.message= "Successfully post your request";
    })
        .catchError((e){
      bloodPostresponseMessage.code=500;
      bloodPostresponseMessage.message = e;
    });
    return bloodPostresponseMessage;

  }

  static Stream<QuerySnapshot> readBloodPostRequest (){
    CollectionReference notesItemCollection = _Collection;
    return notesItemCollection.snapshots();
  }


}