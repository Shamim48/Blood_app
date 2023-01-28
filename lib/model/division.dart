
import 'package:blood_app/model/districs_model.dart';
import 'package:blood_app/model/division_model.dart';
import 'package:firebase_database/firebase_database.dart';

class DivisionList{
  List<DivisionModel> _divList=[];
  List<DivisionModel> get divList=>_divList;

  List<DistrictsModel> _disList=[];
  List<DistrictsModel> get disList=>_disList;



  var divisionRef = FirebaseDatabase.instance.ref();
  void retrieveDivisionData() {
    divisionRef.child("division").onChildAdded.listen((data) {
      DivisionModel divisionModel = DivisionModel.fromJson(data.snapshot.value as Map);
      _divList.add(divisionModel);
      print("Division List:");
      print(_divList);
    });
  }

  void retrieveDistrictData(String divId) {
    divisionRef.child("districts").orderByChild("division_id").equalTo("1").onChildAdded.listen((data) {
      DistrictsModel disModel = DistrictsModel.fromJson(data.snapshot.value as Map);
      _disList.add(disModel);
      print("Districts  List:");
      print(_disList);
    });
  }


}