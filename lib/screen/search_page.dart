
import 'package:blood_app/model/districs_model.dart';
import 'package:blood_app/model/division_model.dart';
import 'package:blood_app/model/donner_model.dart';
import 'package:blood_app/model/upazila_model.dart';
import 'package:blood_app/provider/division_provider.dart';
import 'package:blood_app/provider/upazila_provider.dart';
import 'package:blood_app/screen/profile.dart';
import 'package:blood_app/screen/signup.dart';
import 'package:blood_app/utils/dimensions.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../utils/color_resources.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

final Divisioncontroller = TextEditingController();
final Districtcontroller = TextEditingController();
final Subdistrictcontroller = TextEditingController();
var _scaffoldkey = GlobalKey<ScaffoldState>();

class _SearchPageState extends State<SearchPage> {


  String? DivisionChoose;
  List divisionItem = [
    "Dhaka",
    "Chittagong",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh"
  ];

  String? divisionChoose;
  String? districtChoise;
  String? upazilasChoise;

  String bloodGroup="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DivisionProvider>(context, listen: false).retrieveDivisionData();
  }


  @override
  Widget build(BuildContext context) {

    final division = Container(
      height: 40,
      width: MediaQuery.of(context).size.width/2.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButton(
          hint: Text("Division", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700],),
          iconSize: 30,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
          value: divisionChoose,
          onChanged: (value){
            setState(() {
              divisionChoose = value as String?;
            });
          },
          items: DivisionItem.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );

    var div= Container(
      margin: EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width/2.50-15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Text('  Divistion:', style: LatoMedium.copyWith(
              color: ColorResources.BLACK,
              fontSize: Dimensions.FONT_SIZE_DEFAULT),),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Consumer<DivisionProvider>(
            builder: (context, divisionProvider, child) =>
            divisionProvider.divList != null ? divisionProvider.divList!.length > 0 ? Container(
                height: 40,
                padding: EdgeInsets.only(left: 15),
                decoration: textFieldDecoration(),
                child: DropdownButton<DivisionModel>(
                  underline: SizedBox(),
                  isExpanded: true,
                  dropdownColor: ColorResources.WHITE,
                  icon: Icon(
                      CupertinoIcons.chevron_forward, size: 20,
                      color: ColorResources.getHintColor(context)),
                  hint: Text('Select Division',
                      style: LatoRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  value: divisionProvider.divisionPossition == -1 ? null : divisionProvider
                      .divList![divisionProvider.divisionPossition],
                  items: divisionProvider.divList!.map((
                      DivisionModel divName) {
                    return DropdownMenuItem<DivisionModel>(
                      value: divName,
                      child: Text(divName.name,
                          style: LatoRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: Dimensions
                                  .FONT_SIZE_DEFAULT),
                          overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (DivisionModel? divisionData){
                    int index = divisionProvider.divList!.indexOf(divisionData!);
                    divisionProvider.setDivisionPosition(index);
                    divisionProvider.setDivision(divisionData.name);
                    divisionProvider.retrieveDistrictData(divisionData.id);
                    divisionProvider.setDisPosition(-1);
                    },

                )) : Container(
                width: MediaQuery.of(context).size.width/2.50-15,
                height: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:10),
                decoration: textFieldDecoration(),
                child: Text('No Division Yet!')) : Center(
                child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );

    final distric = Container(
      margin: EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width/2.50-15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Text('  District:', style: LatoMedium.copyWith(
              color: ColorResources.BLACK,
              fontSize: Dimensions.FONT_SIZE_DEFAULT),),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Consumer<DivisionProvider>(
            builder: (context, divisionProvider, child) =>
            divisionProvider.disList != null ? divisionProvider.disList!.length > 0 ? Container(
                height: 40,
                padding: EdgeInsets.only(left: 15),
                decoration: textFieldDecoration(),
                child: DropdownButton<DistrictsModel>(
                  underline: SizedBox(),
                  isExpanded: true,
                  dropdownColor: ColorResources.WHITE,
                  icon: Icon(
                      CupertinoIcons.chevron_forward, size: 20,
                      color: ColorResources.getHintColor(context)),
                  hint: Text('Select District',
                      style: LatoRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  value: divisionProvider.disPossition == -1 ? null : divisionProvider
                      .disList![divisionProvider.disPossition],
                  items: divisionProvider.disList!.map((
                      DistrictsModel divName) {
                    return DropdownMenuItem<DistrictsModel>(
                      value: divName,
                      child: Text(divName.name,
                          style: LatoRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: Dimensions
                                  .FONT_SIZE_DEFAULT),
                          overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (DistrictsModel? disData){
                    int index = divisionProvider.disList!.indexOf(disData!);
                    divisionProvider.setDisPosition(index);
                    divisionProvider.setdis(disData.name);
                   setState(() {
                     Provider.of<UpazilaProvider>(context, listen: false).getUpazilaList(disData.id);
                     Provider.of<UpazilaProvider>(context, listen: false).setUpazilaPosition(-1);

                   });
                  },

                )) : Container(
                width: MediaQuery.of(context).size.width/2.50-15,
                height: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:10),
                decoration: textFieldDecoration(),
                child: Text('No District Yet!')) : Center(
                child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
    final upozilas = Container(
      margin: EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width/2.50-15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Text('  Upazila:', style: LatoMedium.copyWith(
              color: ColorResources.BLACK,
              fontSize: Dimensions.FONT_SIZE_DEFAULT),),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Consumer<UpazilaProvider>(
            builder: (context, upazilaProvider, child) =>
            upazilaProvider.upazilaList != null ? upazilaProvider.upazilaList!.length > 0 ? Container(
                height: 40,
                padding: EdgeInsets.only(left: 15),
                decoration: textFieldDecoration(),
                child: DropdownButton<UpazilaModel>(
                  underline: SizedBox(),
                  isExpanded: true,
                  dropdownColor: ColorResources.WHITE,
                  icon: Icon(
                      CupertinoIcons.chevron_forward, size: 20,
                      color: ColorResources.getHintColor(context)),
                  hint: Text('Select Upazila',
                      style: LatoRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  value: upazilaProvider.upaPossition == -1 ? null : upazilaProvider
                      .upazilaList![upazilaProvider.upaPossition],
                  items: upazilaProvider.upazilaList!.map((
                      UpazilaModel upazila) {
                    return DropdownMenuItem<UpazilaModel>(
                      value: upazila,
                      child: Text(upazila.name,
                          style: LatoRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: Dimensions
                                  .FONT_SIZE_DEFAULT),
                          overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (UpazilaModel? upaData){
                    int index = upazilaProvider.upazilaList!.indexOf(upaData!);
                    upazilaProvider.setUpazilaPosition(index);
                    upazilaProvider.setUpazilaId(upaData.id);
                    setState(() {

                    });
                  },

                )) : Container(
                width: MediaQuery.of(context).size.width/2.50-15,
                height: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:10),
                decoration: textFieldDecoration(),
                child: Text('No Upazila Yet!')) : Center(
                child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/fci_blood_donation_logo.png",fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          leadingWidth: 80,
          toolbarHeight: 80,
          title: const Text("FCI BLOOD BANK",style: TextStyle(fontWeight: FontWeight.bold,color: ColorResources.BLOOD_COLOR,fontSize: 25),),
          centerTitle: true,
         /* actions: [
            InkWell(
              onTap: () {
                _scaffoldkey.currentState?.openEndDrawer();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/images/menus.png",
                    color: ColorResources.COLOR_PRIMARY,
                  ),
                ),
              ),
            ),
          ],*/
        ),

        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       // division,
                        div,
                        SizedBox(width: 10,),
                        distric
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width/2.50-15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Text('  Upazila:', style: LatoMedium.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT),),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Consumer<UpazilaProvider>(
                                builder: (context, upazilaProvider, child) =>
                                upazilaProvider.upazilaList != null ? upazilaProvider.upazilaList!.length > 0 ? Container(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 15),
                                    decoration: textFieldDecoration(),
                                    child: DropdownButton<UpazilaModel>(
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      dropdownColor: ColorResources.WHITE,
                                      icon: Icon(
                                          CupertinoIcons.chevron_forward, size: 20,
                                          color: ColorResources.getHintColor(context)),
                                      hint: Text('Select Upazila',
                                          style: LatoRegular.copyWith(
                                              color: ColorResources.BLACK,
                                              fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                                      value: upazilaProvider.upaPossition == -1 ? null : upazilaProvider
                                          .upazilaList![upazilaProvider.upaPossition],
                                      items: upazilaProvider.upazilaList!.map((
                                          UpazilaModel upazila) {
                                        return DropdownMenuItem<UpazilaModel>(
                                          value: upazila,
                                          child: Text(upazila.name,
                                              style: LatoRegular.copyWith(
                                                  color: ColorResources.BLACK,
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_DEFAULT),
                                              overflow: TextOverflow.ellipsis),
                                        );
                                      }).toList(),
                                      onChanged: (UpazilaModel? upaData){
                                        int index = upazilaProvider.upazilaList!.indexOf(upaData!);
                                        upazilaProvider.setUpazilaPosition(index);
                                        upazilaProvider.setUpazilaId(upaData.id);
                                        setState(() {

                                        });
                                      },

                                    )) : Container(
                                    width: MediaQuery.of(context).size.width/2.50-15,
                                    height: 40,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left:10),
                                    decoration: textFieldDecoration(),
                                    child: Text('No Upazila Yet!')) : Center(
                                    child: CupertinoActivityIndicator()),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(child: Container())

                      ],
                    ),
                  ),

                  /*Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        upozilas,
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: ColorResources.COLOR_PRIMARY
                            ),
                            child: Text("Search Blood", style: LatoBold,),
                          ),
                        )
                      ],
                    ),
                  ),*/
/*
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: DropdownButton(
                          hint:  Text("Subdistrict"),
                          icon:  Icon(Icons.arrow_drop_down),
                          iconSize: 30,
                          isExpanded: true,
                          underline: SizedBox(),
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          value: DivisionChoose,
                          onChanged: (value) {
                            setState(() {
                              DivisionChoose = value as String?;
                            });
                          },
                          items: divisionItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      )),
*/
                  Padding(
                    padding:  EdgeInsets.all(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  bloodGroup="A+";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                      border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                      color: bloodGroup=="A+" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)),

                                    ),
                                    child: Center(
                                        child: Text(
                                          "A+",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup=="A+" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  bloodGroup="AB+";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                      color: bloodGroup=="AB+" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child:  Center(
                                        child: Text(
                                          "AB+",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup=="AB+" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  bloodGroup="O+";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                        border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                        color: bloodGroup=="O+" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                    child:  Center(
                                        child: Text(
                                          "O+",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup == "O+" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  bloodGroup="B+";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                        color: bloodGroup=="B+" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                    child:  Center(
                                        child: Text(
                                          "B+",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup == "B+" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  bloodGroup="AB-";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                        border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                        color: bloodGroup=="AB-" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                    child:  Center(
                                        child: Text(
                                          "AB-",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup == "AB-" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  bloodGroup="O-";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                        border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                        color: bloodGroup=="O-" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                    child:  Center(
                                        child: Text(
                                          "O-",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup == "O-" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  bloodGroup="A-";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                        border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                        color: bloodGroup=="A-" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                    child:  Center(
                                        child: Text(
                                          "A-",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup == "A-" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  bloodGroup="B-";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                      border: Border.all(width: 2,color: ColorResources.COLOR_PRIMARY),
                                      color: bloodGroup=="B-" ? ColorResources.COLOR_PRIMARY: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child:  Center(
                                        child: Text(
                                          "B-",
                                          style: TextStyle(
                                              fontSize: 18, color: bloodGroup == "B-" ? Colors.white: ColorResources.COLOR_PRIMARY, fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text("Blood Donor List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.2,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("signup").where("upozilas", isEqualTo: upazilasChoise).where("Blood_Group", isEqualTo: bloodGroup).limit(100).snapshots(),
                builder: (context , snapshots){
                  return (snapshots.connectionState==ConnectionState.waiting) ?
                  Center(child: CircularProgressIndicator(),)
                      : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (BuildContext context, int index ){
                      var data=snapshots.data!.docs[index].data() as Map<String , dynamic>;
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(isDonner: true, donnerPhone: data[DonnerModel.PHONE])));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20,bottom: 10),
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width-120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                                border: Border.all(width: 1,color: ColorResources.COLOR_PRIMARY)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10, top: 10, bottom: 10),
                              child: Container(
                                child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: Colors.black),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Center(child: Text(data[DonnerModel.BLOOD_GROUP], style: TextStyle(color: ColorResources.COLOR_PRIMARY, fontSize: 10, fontWeight: FontWeight.bold),)),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${data[DonnerModel.NAME]}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
                                                Text("Last Donation : ${data[DonnerModel.LAST_DONATE_TIME]}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], overflow: TextOverflow.clip, fontSize: 14),),
                                                SizedBox(height: 5,),
                                                Row(
                                                  children: [
                                                    Text("Number : ${data[DonnerModel.PHONE]}",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14)),
                                                    // IconButton(onPressed: (){},
                                                    //     icon: Icon(Icons.call,size: 15,))
                                                  ],
                                                ),
                                                // SizedBox(height: 5,),
                                                Text("Location : ${data[DonnerModel.DISTRICT]},${data[DonnerModel.UPOZILAS]} ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14),),
                                              ],
                                            ),

                                          ],
                                        ),
                              ),

                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


