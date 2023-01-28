import 'package:blood_app/model/upazila_model.dart';
import 'package:blood_app/repository/upazila_repo.dart';
import 'package:flutter/cupertino.dart';

class UpazilaProvider with ChangeNotifier {
  UpazilaRepo upazilaRepo=UpazilaRepo();

  List<UpazilaModel> _upazilaList=[];
  List<UpazilaModel>  get upazilaList=>_upazilaList;

  String _upazilaId="";
  String get upazilaId=>_upazilaId;

  int _upaPosition=-1;
  int get upaPossition=>_upaPosition;

   getUpazilaList(String disId) async {
     _upazilaList.clear();
    _upazilaList= await upazilaRepo.upazilaData(disId);
    notifyListeners();
  }

  void setUpazilaId(String upazilaId){
     _upazilaId=upazilaId;
     notifyListeners();
  }
  void setUpazilaPosition(int position){
     _upaPosition=position;
     notifyListeners();
  }

}