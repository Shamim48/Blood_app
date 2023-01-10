
import 'package:blood_app/model/blood_post_message.dart';
import 'package:blood_app/screen/signup.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection("Activity_Post");

class ActivityPostCrud{
  //Add User here
  static Future<BloodPostResponseMessage> addActivityPost({
    String? activity_info,
    String? image_url,
    String? activity_post_uid,
  }) async {
    BloodPostResponseMessage bloodPostresponseMessage = BloodPostResponseMessage();
    DocumentReference documentReference = _Collection.doc();

    Map<String, dynamic> data= <String, dynamic>{
      "activity_info" : activity_info,
      "image_url" : image_url,
      "activity_post_uid": activity_post_uid,
      "date": getDate(),
      "time": getTime(),
    };

    var result = await documentReference.set(data)
        .whenComplete(() {
      bloodPostresponseMessage.code =200;
      bloodPostresponseMessage.message= "Successfully add your post  ";
    })
        .catchError((e){
      bloodPostresponseMessage.code=500;
      bloodPostresponseMessage.message = e;
    });
    return bloodPostresponseMessage;

  }

  static Stream<QuerySnapshot> readActivityPost(){
    CollectionReference notesItemCollection = _Collection;
    return notesItemCollection.snapshots();
  }

  // static Future<DocumentSnapshot> readSingleDoner({required String? id})async {
  //   CollectionReference notesItemCollection = _collection;
  //   DocumentReference documentReferencer = _collection.doc(id);
  //   DocumentSnapshot documentSnapshot=await documentReferencer.get();
  //   return documentSnapshot;
  // }


}