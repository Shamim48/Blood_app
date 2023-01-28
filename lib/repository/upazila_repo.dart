import 'package:blood_app/model/upazila_model.dart';
import 'package:firebase_database/firebase_database.dart';

class UpazilaRepo{
  
  var rootRef=FirebaseDatabase.instance.ref();
  
  Future<List<UpazilaModel>> upazilaData(String disId) async{
    List<UpazilaModel> upazilaList=[];
    rootRef.child("upazilas").orderByChild("district_id").equalTo(disId).onChildAdded.listen((data) {
      UpazilaModel upazila= UpazilaModel.fromJson(data.snapshot.value as Map);
      upazilaList.add(upazila);
      print("Upazila List:");
      print(upazilaList);
    });
    return upazilaList;
  }
  
}