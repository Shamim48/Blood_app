
import 'package:blood_app/model/districs_model.dart';
import 'package:firebase_database/firebase_database.dart';

class DistrictRepo{
  var rootRef=FirebaseDatabase.instance.ref();

  Future<List<DistrictsModel>> districtData(String divId) async{
    List<DistrictsModel> districtList=[];
    rootRef.child("districts").orderByChild("division_id").equalTo(divId).onChildAdded.listen((data) {
      DistrictsModel district= DistrictsModel.fromJson(data.snapshot.value as Map);
      districtList.add(district);
      print("District List:");
      print(districtList);
    });
    return districtList;
  }

}