import 'package:blood_app/main.dart';
import 'package:blood_app/screen/signup.dart';
import 'package:blood_app/utils/color_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({Key? key}) : super(key: key);

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {

  final GlobalKey<FormState> _ScaffoldKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String emailChak = "";

  TextEditingController _codeController=TextEditingController();

  late FirebaseAuth _auth;
 // late FirebaseMessaging fcm;
  late DatabaseReference db;

  String smsCode="";


  var _credential;

  var _validate=false;
  var _isSecureText=true;
  // Password
  final TextEditingController passwordController = TextEditingController();
  bool isVasiable = true;
  _errorText(){
    if(passwordController.text.length < 8){
      print("Password Must be 8 Character");
    }
  }
  String pass = "";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth=FirebaseAuth.instance;
    db= FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 150,),
              const Text("Welecome", style: TextStyle(fontWeight: FontWeight.bold,fontSize:50, )),
              const Text("FCI BLOOD BANK", style: TextStyle(fontWeight: FontWeight.bold,fontSize:30, )),
              Form(
                key: _ScaffoldKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 35, right: 35,),
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter a Phone Number";
                            }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                              return "Please Enter a Valid Phone Number";
                            }
                            else if(value.length > 11){
                              return "Mobile Number must be of 11 digit";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            suffixIcon: Icon(Icons.phone, color: Colors.grey[700],),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 35, right: 35,),
                      child: InkWell(
                        onTap: () async {
                          String number=phoneController.text.trim() ?? "";
                          if(number==""){
                            EasyLoading.showError("Please Enter your phone number");
                            return;
                          }
                          EasyLoading.show(status: "Code Sending");
                          registerUser("+88$number", context );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.deepPurple
                          ),
                          child: Text("Continue",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                      ),
                    ),

                    /*Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Text("Don't have any account?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                },
                                child: Text("Sing Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY),))
                          ],
                        )
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future registerUser(String mobile, BuildContext context) async{

    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential authCredential){
          _auth.signInWithCredential(_credential).then((result) async{
            var user=_auth.currentUser;
            String uid=user!.uid;
           // String? token = await FirebaseMessaging.instance.getToken();
            /*var ref=db.child("User").child(mobile).set({
              "phone": mobile
            });*/
            EasyLoading.dismiss();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SignUp(phoneNumber: "+88${phoneController.text}")), (route) => false);
          }).catchError((e){
            print(e);
          });
        },
        verificationFailed:( authException){
          print(authException.message);
        },
        codeSent: (String verificationId, [int? forceResendingToken]){
          //show dialog to take input from the user
          EasyLoading.dismiss();
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text("Code Sent ${mobile} This Number\nEnter SMS/Call Code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          errorText: _validate ? "You entered wrong OTP" : null,
                          hintText: "Enter SMS/Call Code"
                      ),
                    ),

                  ],
                ),
                actions: <Widget>[
                  Container(
                    color: Colors.green,
                    child: TextButton(
                      child: Text("Submit",style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        FirebaseAuth auth = FirebaseAuth.instance;

                        smsCode = _codeController.text.trim();

                        _credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                        auth.signInWithCredential(_credential).then(( result) async {
                          var user=_auth.currentUser;
                          String uid=user!.uid;
                          //String? token = await FirebaseMessaging.instance.getToken();
                          /*var ref=db.child("User").child(mobile).set({
                            "phone": mobile
                          });*/
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SignUp(phoneNumber: "+88${phoneController.text}")), (route) => false);
                        });
                      },
                    ),
                  )
                ],
              )
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        }
    );
  }

}

