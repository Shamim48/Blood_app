import 'package:blood_app/screen/blood_post_crud_operation.dart';
import 'package:blood_app/screen/blood_post_listpage.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AddBloodPostPage extends StatefulWidget {
  const AddBloodPostPage({Key? key}) : super(key: key);

  @override
  State<AddBloodPostPage> createState() => _AddBloodPostPageState();
}

class _AddBloodPostPageState extends State<AddBloodPostPage> {
  final _problemController = TextEditingController();
  final _bloodController = TextEditingController();
  final _dateController = TextEditingController();
  final _placeController = TextEditingController();
  final _relativenumberController = TextEditingController();
  final _hemoglobingController = TextEditingController();
  final _referanceController = TextEditingController();
  final _moreController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  // List of items in our dropdown menu
  String? valueChoose;
  List listItem = [
    "A+",
    "B+",
    "AB+",
    "O+",
    "A-",
    "B-",
    "O-",
    "AB-",
  ];


  @override
  Widget build(BuildContext context) {


    final dropDownBlood = Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius:const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: DropdownButton(
            hint: const Text("Select blood group"),
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            isExpanded: true,
            underline:const SizedBox(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            value: valueChoose,
            onChanged: (value){
              setState(() {
                valueChoose = value as String?;
              });
            },
            items: listItem.map((valueItem){
              return DropdownMenuItem(
                value:  valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
        )
    );


    final problemField = TextFormField(
      controller: _problemController,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty) {
          return "This field is required";
        }
      },
      decoration:  const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Patient problem",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );


    final bloodAmount = TextFormField(
      controller: _bloodController,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty) {
          return "This field is required";
        }
      },
      decoration:  const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Amount of blood",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,

    );


    final bloodDate = TextFormField(
      controller: _dateController,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "This field is required";
        }
      },
      decoration:  const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Date & Time of blood donation",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );


    final bloodPlace = TextFormField(
      controller: _placeController,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "This field is required";
        }
      },
      decoration:  const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Blood donation place",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );


    final patientRelative = TextFormField(
      controller: _relativenumberController,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "This field is required";
        }
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Patient relative number",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,),
      ),
      keyboardType: TextInputType.number,
    );


    final bloodHemoglobin = TextFormField(
      controller: _hemoglobingController,
      autofocus: false,

      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Hemoglobin",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );


    final referance = TextFormField(
      controller: _referanceController,
      autofocus: false,

      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "Reference",
          labelStyle: TextStyle(fontSize: 14,color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );


    final moreDetails = TextFormField(
      controller: _moreController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: Colors.black
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.BLOOD_COLOR
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: "More...",
          labelStyle: TextStyle(fontSize: 14, color: Colors.black,)
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );

    final postButton = TextButton(
        onPressed: () async{
          if (_formKey.currentState!.validate()){
            var response = await BloodPostCrud.addBloodRequest(
                bloodQuantity: _bloodController.text,
                dateTime: _dateController.text,
                hemoglobin: _hemoglobingController.text,
                more: _moreController.text,
                patientProblem: _problemController.text,
                place: _placeController.text,
                reference: _referanceController.text,
                relative: _relativenumberController.text,
                bloodGroup: valueChoose
            );

              _bloodController.clear();
                _dateController.clear();
               _hemoglobingController.clear();
                 _moreController.clear();
               _problemController.clear();
              _placeController.clear();
                _referanceController.clear();
               _relativenumberController.clear();
            if (response.code == 200){
              EasyLoading.showSuccess("Post request Successful");
            }else {
              EasyLoading.showError( "Post request Failed");
            }
             Navigator.push(context, MaterialPageRoute(builder: (context) => BloodPostListPage(),));
          }

        },
        child: const Text("POST",style: TextStyle(color: ColorResources.BLOOD_COLOR),)
    );


    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.withOpacity(0.9),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                child: Container(
                  height: 770,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                        height: 690,
                          child: ListView(
                            children: [
                             Column(
                               children: [
                                 Container(
                                   width: MediaQuery.of(context).size.width,
                                   height: 80,
                                   decoration: const BoxDecoration(
                                       borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                       image: DecorationImage(
                                           image: AssetImage("assets/images/postbackgorund.png"),fit: BoxFit.cover
                                       )
                                   ),
                                   alignment: Alignment.center,
                                   child: const Text("Send request for blood",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                                 ),
                                 SizedBox(
                                   child: Column(
                                     children: [
                                       const SizedBox(height: 20,),
                                       dropDownBlood,
                                       Form(
                                         key: _formKey,
                                         child: Column(
                                           children: [
                                             const SizedBox(height: 20,),
                                             problemField,
                                             const SizedBox(height: 20,),
                                             bloodAmount,
                                             const SizedBox(height: 20,),
                                             bloodDate,
                                             const SizedBox(height: 20,),
                                             bloodPlace,
                                             const SizedBox(height: 20,),
                                             patientRelative,
                                             const SizedBox(height: 20,),
                                             bloodHemoglobin,
                                             const SizedBox(height: 20,),
                                             referance,
                                             const SizedBox(height: 20,),
                                             moreDetails,
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodListPage(),));
                                  Navigator.pop(context);
                                },
                                child: const Text("CANCEL",style: TextStyle(color: ColorResources.BLOOD_COLOR),)
                            ),
                            postButton,
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




