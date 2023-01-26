import 'package:blood_app/repository/division_repo.dart';
import 'package:flutter/cupertino.dart';

class DivisionProvider with ChangeNotifier{
  DivisionRepo divisionRepo=DivisionRepo();

  List<String> _divisionList=[];
  List<String> get divisionList=>_divisionList;
  String _divisionValue="";
  String get divisionValue=>_divisionValue;

  int _divisionPosition=-1;
  int get divisionPossition=>_divisionPosition;

  getDivisionData() async{
    _divisionList= await divisionRepo.getDivision();
    notifyListeners();
  }

  setDivision(String division){
    _divisionValue=division;
    notifyListeners();
  }
  setDivisionPosition(int divisionPosition){
    _divisionPosition=divisionPosition;
    notifyListeners();
  }
}