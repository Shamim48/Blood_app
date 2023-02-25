

import 'package:blood_app/model/districs_model.dart';
import 'package:blood_app/repository/district_repo.dart';
import 'package:flutter/cupertino.dart';

class DistrictProvider extends ChangeNotifier {
  DistrictRepo districtRepo=DistrictRepo();

  List<DistrictsModel> _districtList=[];
  List<DistrictsModel>  get districtList=>_districtList;

  String _districtId="";
  String get districtId=>_districtId;

  int _districtPosition=-1;
  int get districtPossition=>_districtPosition;

  getDistrictList(String divId) async {
    _districtList.clear();
    _districtList= await districtRepo.districtData(divId);
    notifyListeners();
  }

  void setDistrictId(String divisionId){
    _districtId=divisionId;
    notifyListeners();
  }
  void setDistrictPosition(int position){
    _districtPosition=position;
    notifyListeners();
  }

}