import 'package:blood_app/model/districs_model.dart';
import 'package:blood_app/model/division_model.dart';
import 'package:blood_app/repository/division_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class DivisionProvider with ChangeNotifier{
  DivisionRepo divisionRepo=DivisionRepo();

 // List<String> _divisionList=[];
 // List<String> get divisionList=>_divisionList;

  String _divisionValue="";
  String get divisionValue=>_divisionValue;

  int _divisionPosition=-1;
  int get divisionPossition=>_divisionPosition;

   String _disValue="";
  String get disValue=>_disValue;

  int _disPosition=-1;
  int get disPossition=>_disPosition;



  /*getDivisionData() async{
    _divisionList= await divisionRepo.getDivision();
    notifyListeners();
  }*/

  setDivision(String division){
    _divisionValue=division;
    notifyListeners();
  }
  setDivisionPosition(int divisionPosition){
    _divisionPosition=divisionPosition;
    notifyListeners();
  }

 setdis(String dis){
    _disValue=dis;
    notifyListeners();
  }
  setDisPosition(int disPosition){
    _disPosition=disPosition;
    notifyListeners();
  }


  List<DivisionModel> _divList=[];
  List<DivisionModel> get divList=>_divList;

  List<DistrictsModel> _disList=[];
  List<DistrictsModel> get disList=>_disList;



  var rootRef = FirebaseDatabase.instance.ref();
  void retrieveDivisionData() {
    rootRef.child("division").onChildAdded.listen((data) {
      DivisionModel divisionModel = DivisionModel.fromJson(data.snapshot.value as Map);
      _divList.add(divisionModel);
      print("Division List:");
      print(_divList);
      notifyListeners();
    });
  }

  void retrieveDistrictData(String divId) {
    _disList.clear();
    rootRef.child("districts").orderByChild("division_id").equalTo(divId).onChildAdded.listen((data) {
      DistrictsModel disModel = DistrictsModel.fromJson(data.snapshot.value as Map);
      _disList.add(disModel);
      print("Districts  List:");
      print(_disList);
      notifyListeners();
    });
  }

  void getUpazila(String disId){

  }
}