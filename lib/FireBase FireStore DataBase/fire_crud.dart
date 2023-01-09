import 'package:blood_app/FireBase%20FireStore%20DataBase/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference _signupCollectionReference = _firebaseFirestore.collection('signup');

class AuthCrud {

  // ........................ Loging Number ......................
  //............Create..............
  // static Future<Loging_Response> Loging_CRUD({required String LogNumber}) async {
  //
  //   Loging_Response loging_response = Loging_Response();
  //   DocumentReference documentReference = _signupCollectionReference.doc();
  //
  //   Map<String, dynamic> logingData = <String, dynamic>{
  //     "Loging_Number" : LogNumber,
  //   };
  //
  //   await documentReference.set(logingData).whenComplete((){
  //     loging_response.code = 200;
  //   }).catchError((error){
  //     loging_response.code = 500;
  //   });
  //   return loging_response;
  // }
  // //.......Read Loging..........
  // static Stream<QuerySnapshot> Loging_read(){
  //   CollectionReference notesItemCollection = _signupCollectionReference;
  //   return notesItemCollection.snapshots();
  // }


  //.................. SingUp CRUD.......................
  static Future<SignUp_Response> SignUp_CRUD({
     String? name,
     String? phone,
     String? email,
     String? birthdate,
     String? gender,
     String? bloodgroup,
     String? timedonar,
     String? lastdate,
    String? image_url,
    String? division,
    String? district,
    String? upozilas
  }) async {

    SignUp_Response singUp_Response = SignUp_Response();
    String? phone=FirebaseAuth.instance.currentUser!.phoneNumber;
    DocumentReference documentReference = _signupCollectionReference.doc();

    Map<String, dynamic> singupData = <String, dynamic>{
      "SingUp_name" : name,
      "SingUp_phone" : phone,
      "SingUp_email" : email,
      "SingUp_birthdate" : birthdate,
      "Gender" : gender,
      "Blood_Group" : bloodgroup,
      "TimeDonar" : timedonar,
      "LastDate" : lastdate,
      "image_url": image_url,
      "Division" : division,
      "District" : district,
      "upozilas" : upozilas,


    };

    await documentReference.set(singupData).whenComplete((){
      singUp_Response.code = 200;
      singUp_Response.message = "Successfully Add to the Database";
    }).catchError((error){
      singUp_Response.code = 500;
      singUp_Response.message = error;
    });
    return singUp_Response;
  }
  // .............. read ..............
  static Stream<QuerySnapshot> SignUp_read(){
    CollectionReference notesItemCollection = _signupCollectionReference;
    return notesItemCollection.snapshots();
  }

  static Future<DocumentSnapshot> readCurrentUser({required String? id})async {
    CollectionReference notesItemCollection = _signupCollectionReference;
    DocumentReference documentReferencer = _signupCollectionReference.doc(id);
    DocumentSnapshot documentSnapshot=await documentReferencer.get();
    return documentSnapshot;
  }

  // static Future<DocumentSnapshot> SingUp_SingleRead({required String id})async {
  //   CollectionReference notesItemCollection = _signupCollectionReference;
  //   DocumentReference documentReferencer = _signupCollectionReference.doc(id);
  //   DocumentSnapshot documentSnapshot=await documentReferencer.get();
  //   return documentSnapshot;
  // }


}
