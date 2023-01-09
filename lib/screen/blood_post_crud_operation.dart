
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/blood_post/model_two/blood_post_message.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection("Blood Post Request");

class BloodPostCrud{
  //Add User here
  static Future<BloodPostResponseMessage> addBloodRequest({
    required String? bloodGroup,
    required String? patientProblem,
    required String? bloodQuantity,
    required String? dateTime,
    required String? place,
    required String? relative,
    required String? hemoglobin,
    required String? reference,
    required String? more,
  }) async {
    BloodPostResponseMessage bloodPostresponseMessage = BloodPostResponseMessage();
    DocumentReference documentReference = _Collection.doc();

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



  // Update user here
  static Future<BloodPostResponseMessage> updateBloodPost ({
    required String? bloodGroup,
    required String? patientProblem,
    required String? bloodQuantity,
    required String? dateTime,
    required String? place,
    required String? relative,
    required String? hemoglobin,
    required String? reference,
    required String? more,
    required String? docId,
  })async {
    BloodPostResponseMessage responseMessage = BloodPostResponseMessage();
    DocumentReference documentReference = _Collection.doc(docId);

    Map<String , dynamic> data = <String, dynamic>{
      "blood_group" : bloodGroup,
      "patient_problem" : patientProblem,
      "blood_quantity" : bloodQuantity,
      "date_time" : dateTime,
      "place_where" : place,
      "relative_mobile" : relative,
      "hemoglobin" : hemoglobin,
      "reference": reference,
      "more_details" : more,
    };

    await documentReference
        .update(data)
        .whenComplete(() {
      responseMessage.code= 200;
      responseMessage.message = "Successfully updated";
    })
        .catchError((e){
      responseMessage.code = 500;
      responseMessage.message = e;
    });
    return responseMessage;
  }
}