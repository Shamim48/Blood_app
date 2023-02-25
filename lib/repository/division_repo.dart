

import 'package:blood_app/model/division_model.dart';
import 'package:firebase_database/firebase_database.dart';

class DivisionRepo{

  var rootRef=FirebaseDatabase.instance.ref();

  Future<List<DivisionModel>> divisionData() async{
    List<DivisionModel> divisionList=[];
    rootRef.child("division").onChildAdded.listen((data) {
      DivisionModel divisionModel = DivisionModel.fromJson(data.snapshot.value as Map);
      divisionList.add(divisionModel);
      print("Division List:");
      print(divisionList);
    });
    return divisionList;
  }

}