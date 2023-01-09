
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

  String bloodGroup="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,

        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                            "assets/images/blood-drop.png",
                          )),
                      Container(
                        child: Expanded(
                          child: Container(
                            height: 45,
                            width: 100,
                            child: const Center(
                                child: Text(
                                  "FCI Blood Bank",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: InkWell(
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
                                    "assets/images/menu-bar.png",
                                    color: ColorResources.COLOR_PRIMARY,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding:
                              EdgeInsets.only(right: 15, left: 15),
                              child: DropdownButton(
                                hint: Text("Division"),
                                icon:  Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                isExpanded: true,
                                underline: SizedBox(),
                                style: const TextStyle(
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
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.only(right: 15, left: 15),
                              child: DropdownButton(
                                hint: const Text("District"),
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                isExpanded: true,
                                underline: SizedBox(),
                                style: const TextStyle(
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
                      ],
                    ),
                  ),
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
                  Padding(
                    padding:  EdgeInsets.all(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  bloodGroup="A+";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 85,
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
                                    width: 85,
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
                                    width: 85,
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
                                    width: 85,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  bloodGroup="AB-";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 85,
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
                                    width: 85,
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
                                    width: 85,
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
                                    width: 85,
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index ){
                  return Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,bottom: 10),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(width: 1,color: ColorResources.COLOR_PRIMARY)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(width: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                      child: Center(child: Text("AB+", style: TextStyle(color: ColorResources.COLOR_PRIMARY, fontSize: 10, fontWeight: FontWeight.bold),)),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Shek Farid Uddin Robin", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
                                        Text("Last Donation : 10-06-2022", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14),),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text("Number : 01747606057",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14)),
                                            // IconButton(onPressed: (){},
                                            //     icon: Icon(Icons.call,size: 15,))
                                          ],
                                        ),
                                        // SizedBox(height: 5,),
                                        Text("Location : Feni", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14),),
                                      ],
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(onPressed: (){},
                                      icon: Icon(Icons.call,color: Colors.green,),
                                    ),
                                    IconButton(onPressed: (){},
                                      icon: Icon(Icons.message,color: Colors.amber,),
                                    ),

                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


