
import 'dart:io';
import 'package:blood_app/main.dart';
import 'package:blood_app/screen/home_paage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../FireBase FireStore DataBase/fire_crud.dart';
import '../utils/color_resources.dart';

class SignUp extends StatefulWidget {
  String phoneNumber;
   SignUp({Key? key , required this.phoneNumber}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

String image_url="";


class _SignUpState extends State<SignUp> {

  String fileName="";
  File? file;
  final ImagePicker picker = ImagePicker();
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

 late DocumentSnapshot donnerDoc;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String emailChak = "";
  // Password
  final TextEditingController passwordController = TextEditingController();
  bool isVasiable = true;
  _errorText(){
    if(passwordController.text.length < 8){
      print("Password Must be 8 Character");
    }
  }
  String pass = "";
  //........
  String birthdate = "Birth Date";
  String? selectGender;
  String? selectBloodGroup;
  final TextEditingController timeDonarController = TextEditingController();
  String lastdate = "What is the last date of blood donation?";
  String? divisionChoose;
  String? districtChoise;
  String? upazilasChoise;
  String? unionChoise;





// Camera
  void _chooseCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // Gallery
  void _chooseGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // Upload File
  Future uploadFile() async {
    if (file == null) return;
    DateTime dateTime = DateTime.now();
    final destination = 'files/';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);//.child('$dateTime');
      await ref.putFile(file!).snapshotEvents.listen((event) {
        switch(event.state)  {
          case TaskState.running:
            EasyLoading.show(status: "Your Image Uploading...");
            break;
          case TaskState.success:
            EasyLoading.dismiss();
            registerDonner(ref);
            break;
          case TaskState.canceled:
            EasyLoading.dismiss();
          EasyLoading.showError("Image Upload Failed");

            break;

        }
      });

    } catch (e) {
      print('error occured');
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleDonner();
  }

  singleDonner()async{
      donnerDoc= await  AuthCrud.readCurrentUser(id: widget.phoneNumber);
      if(donnerDoc.exists){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }else{
        phoneController.text=widget.phoneNumber;
      }
  }



  // late DocumentSnapshot employeeDoc;
  //
  // readSingleEmployee() async{
  //   String id;
  //   employeeDoc= await  FirebaseCrud.SingUp_SingleRead(id: widget.id);
  //   nameController.value = TextEditingValue(text: employeeDoc["SingUp_name"]);
  //   phoneController.value = TextEditingValue(text: employeeDoc["SingUp_phone"]);
  //   emailController.value = TextEditingValue(text: employeeDoc["SingUp_email"]);
  // }

  final GlobalKey<FormState> _ScaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final name = Container(
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: nameController,
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
          labelText: "Name",
          labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: ColorResources.COLOR_PRIMARY,
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: Icon(Icons.person, color: Colors.grey[700],),
        ),
      ),
    );
    final phone = Container(
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: phoneController,
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: ColorResources.COLOR_PRIMARY,
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: Icon(Icons.call, color: Colors.grey[700],),
        ),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        emailChak = value;
        setState(() {

        });
      },
      decoration: InputDecoration(
        labelText: "Email Address",
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
              color: ColorResources.COLOR_PRIMARY,
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        suffixIcon: Icon(Icons.email, color: Colors.grey[700],),
      ),
    );
    final date = InkWell(
      onTap: () async {
        DateTime? dateTime = await getDateFromCalendar(context);
        String? day;
        String? month;
        String? year;
        dateTime!.day<10 ? day='0${dateTime.day}' : day='${dateTime.day}';
        dateTime.month<10 ? month='0${dateTime.month}' : month='${dateTime.month}';
        year='${dateTime.year}';
        birthdate='$day-$month-$year';
        setState(() {

        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(birthdate, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),),
                  Icon(Icons.date_range, color: Colors.grey[700],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    final gender = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButton(
          hint: Text("Select Gender", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700],),
          iconSize: 30,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
          value: selectGender,
          onChanged: (value){
            setState(() {
              selectGender = value as String?;
            });
          },
          items: GenderItem.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
    final group = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButton(
          hint: Text("Select Blood Group", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700],),
          iconSize: 30,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
          value: selectBloodGroup,
          onChanged: (value){
            setState(() {
              selectBloodGroup = value as String?;
            });
          },
          items: BloodGroup.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
    final timedonar = Container(
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: timeDonarController,
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
          labelText: "How many times have you donated blood?",
          labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: ColorResources.COLOR_PRIMARY,
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
    final lastdates = InkWell(
      onTap: () async {
        DateTime? dateTime = await getDateFromCalendar(context);
        String? day;
        String? month;
        String? year;
        dateTime!.day<10 ? day='0${dateTime.day}' : day='${dateTime.day}';
        dateTime.month<10 ? month='0${dateTime.month}' : month='${dateTime.month}';
        year='${dateTime.year}';
        lastdate='$day-$month-$year';
        setState(() {

        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(lastdate, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),),
                  Icon(Icons.date_range, color: Colors.grey[700],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    final person = Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Text("Permanent Address ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.deepPurple),),
        ],
      ),
    );
    final division = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
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
    final distric = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButton(
          hint: Text("District", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700],),
          iconSize: 30,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
          ),
          value: districtChoise,
          onChanged: (value){
            setState(() {
              districtChoise = value as String?;
            });
          },
          items: DistrictItem.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
    final upozilas = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButton(
          hint: Text("Upazilas", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700],),
          iconSize: 30,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
          value: upazilasChoise,
          onChanged: (value){
            setState(() {
              upazilasChoise = value as String?;
            });
          },
          items: Upazilas.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
    // final union = Container(
    //   height: 50,
    //   width: MediaQuery.of(context).size.width,
    //   decoration: BoxDecoration(
    //     border: Border.all(width: 1, color: Colors.grey),
    //     borderRadius: BorderRadius.circular(40),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 15, right: 15),
    //     child: DropdownButton(
    //       hint: Text("Union", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
    //       icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700],),
    //       iconSize: 30,
    //       isExpanded: true,
    //       underline: SizedBox(),
    //       style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 18,
    //           fontWeight: FontWeight.w500
    //       ),
    //       value: unionChoise,
    //       onChanged: (value){
    //         setState(() {
    //           unionChoise = value as String?;
    //         });
    //       },
    //       items: Union.map((valueItem){
    //         return DropdownMenuItem(
    //           value: valueItem,
    //           child: Text(valueItem),
    //         );
    //       }).toList(),
    //     ),
    //   ),
    // );
    final registration = InkWell(
      onTap: () async {
        if(file==null){
          EasyLoading.showError("Please Select Image");
          return;
        }
        if(divisionChoose==""){
          EasyLoading.showError("Please Select Division");
          return;
        }
        if(districtChoise==""){
          EasyLoading.showError("Please Select District");
          return;
        }
        if(upazilasChoise==""){
          EasyLoading.showError("Please Select Upazila");
          return;
        }
        if (_ScaffoldKey.currentState!.validate()) {
          uploadFile();
        }

        // String? signInmsg = await authenticationService.signIn(email: emailChak, password: pass);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.deepPurple
        ),
        child: Text("Registation Now",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
    final skipp = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenHome()));
            },
            child: Text("Skip >", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.deepPurple,
            child: Center(child: Text("SingUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)),
          ),
          SizedBox(height: 20,),

          Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: CircleAvatar(
                    radius: 71,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: file == null ?
                      null : FileImage(file!),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                    left: 110,
                    child: RawMaterialButton(
                      elevation: 10,
                    fillColor: ColorResources.COLOR_PRIMARY,
                    child: Icon(Icons.add_a_photo),
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),
                    onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Choose Option", style: TextStyle(fontWeight: FontWeight.w600, color: ColorResources.COLOR_PRIMARY),),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      _chooseCamera();
                                      Navigator.pop(context);
                                    },
                                    splashColor: ColorResources.COLOR_PRIMARY,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.camera, color: ColorResources.COLOR_PRIMARY,),
                                        ),
                                        Text("Camera", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),)
                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){
                                      _chooseGallery();
                                      Navigator.pop(context);
                                    },
                                    splashColor: ColorResources.COLOR_PRIMARY,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.image, color: ColorResources.COLOR_PRIMARY,),
                                        ),
                                        Text("Gallery", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                    }))
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Form(
              key: _ScaffoldKey,
              child: Column(
                children: [
                  //.................. Name .........................
                  name,

                  //....................Phone.................
                  SizedBox(height: 20,),
                  phone,

                  //...................Email.....................
                  SizedBox(height: 20,),
                  email,

                  //....................Birth Date.......................
                  SizedBox(height: 20,),
                  date,

                  //..................... Gender........................
                  SizedBox(height: 20,),
                  gender,

                  //......................Blood Group........................
                  SizedBox(height: 20,),
                  group,

                  //.................. Time Donar..........................
                  SizedBox(height: 20,),
                  timedonar,

                  //.................... last date
                  SizedBox(height: 20,),
                  lastdates,

                  //............ Person Name Just...................
                  person,

                  //.................. Division..................
                  division,

                  //...................... Distric.....................
                  SizedBox(height: 20,),
                  distric,

                  //.................Upazilas..........................
                  SizedBox(height: 20,),
                  upozilas,
                  //,,,,,,,,,,,,,,,,,,,,,,Union..................
                  // SizedBox(height: 20,),
                  // union,

                  //..................... Registation................
                  SizedBox(height: 40,),
                  registration,
                  SizedBox(height: 20,),

                  //................... Skip..................
                  skipp,
                  SizedBox(height: 20,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void registerDonner(var ref) async {
    String  image_url= await ref.getDownloadURL();
      var response = await AuthCrud.SignUp_CRUD(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        birthdate: birthdate,
        gender: selectGender.toString(),
        bloodgroup: selectBloodGroup.toString(),
        timedonar: timeDonarController.text,
        lastdate: lastdate== "What is the last date of blood donation?" ? "": lastdate,
        image_url: image_url ?? "",
        division: divisionChoose ?? "",
        district: districtChoise ?? "",
        upozilas: upazilasChoise ?? "",
      );
      FirebaseAuth auth = FirebaseAuth.instance;
      String? userId = auth.currentUser!.uid;
      if(response.code == 200){
        EasyLoading.showSuccess("Donner Registration Success");
        /*showDialog(context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(response.message.toString()),
              );
            });*/
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()), (route) => false);
      }
      else{
        EasyLoading.showError("Donner Registration Failed");
       /* showDialog(context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(response.message.toString()),
              );
            });*/
      }
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      passwordController.clear();
      timeDonarController.clear();

  }
}

//Date Time
Future<DateTime?> getDateFromCalendar(BuildContext context) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1960, 12,12),
    lastDate: DateTime(2060, 7, 15),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.deepPurple,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
  );
}

List GenderItem = [
  "Select Gender",
  "Male",
  "Female"
];

List BloodGroup = [
  "Select Blood Group",
  "A+",
  "A-",
  "B+",
  "B-",
  "O+",
  "O-",
  "AB+",
  "AB-",
];

List DivisionItem = [
  "Chittagong",
  "Dhaka",
  "Rajshahi",
  "Sylhet",
  "Khulna",
  "Barisal",
  "Rangpur",
  "Mymensingh",
];
List DistrictItem = [
  "Feni",
  "Chitagogn",
  "Commilla",
  "Noakhali",
  "Chadpur",
  "Gazipur",
  "Kishoreganj",
  "Manikganj",
  "	Munshiganj",
  "Narayanganj",
  "Narsingdi",
  "Tangail",
  "Faridpur",
  "Gopalganj",
  "Madaripur",
  "Rajbari",
  "Shariatpur",
];
List Upazilas = [
  "Feni Sadar",
  "Chagol Naiya",
  "Porshuram",
  "Sunagazi",
  "Dagonbuiya",
  "Dohar",
  "Keraniganj",
  "Dhamrai",
  "Nawabganj",
  "Savar",
];
List Union = [

];