

class DivisionRepo{
  List<String> divisionList=[
    "Dhaka",
    "Chittagong",
    "Mymenshingh",
    "Ragnpur",
    "Khulna"
  ];



  Future<List<String>> getDivision() async{

    return await divisionList;
  }




}