import 'package:blood_app/model/division_model.dart';
import 'package:firebase_database/firebase_database.dart';

class DivisionRepo{
  List<String> divisionList=[
    "Dhaka",
    "Chittagong",
    "Mymenshingh",
    "Ragnpur",
    "Khulna"
  ];



  Future<List<String>> getDivision() async{
    /*List<DivisionModel> divList=[];
    var divisionRef = FirebaseDatabase.instance.ref("division");
    divisionRef.onValue.listen((event) {
      for (var child in event.snapshot.children) {
        var resultList = child.value;
        for(var i = 0; i < resultList.length; i++) {
          Map<dynamic, dynamic> map = Map.from(resultList[i]);
          list.add(BaseModel(model: modelType, key: i.toString(), snapshot: map));
        }
        divList.add(child.value);
      }
    }, onError: (error) {
      // Error.
    });*/
    return await divisionList;
  }

}