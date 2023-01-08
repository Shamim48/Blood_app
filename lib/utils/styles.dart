
import 'package:blood_app/utils/color_resources.dart';
import 'package:blood_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dimensions.dart';

const LatoLight = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w300,
);

const LatoRegular = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w400,
);

const LatoMedium = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w500,
);

const LatoBlack = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w500,
);

const LatoSemiBold = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w600,
);


const LatoBold = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w700,
);

textFieldDecoration(){
  return BoxDecoration(
    color: ColorResources.TEXT_FIELD_BG,
    borderRadius: BorderRadius.circular(30),
  );
}

toast(String msg){
 return Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
toastSuccess(String msg){
 return Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

Container roundedLogo(double weight, double height, double padding, double borderWeight) {
  return Container(
    height: height,
    width: weight,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
        color: ColorResources.WHITE,
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWeight,
          color: ColorResources.Border_color,
        )
    ),
    child: Image.asset(Images.logo_edu,  ),
  );
}

getDate(){
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MM-dd-yyyy').format(now);
  print(formattedDate);
  return  formattedDate;
}

getTime(){
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('HH:mm').format(now);
  print(formattedTime);
  return  formattedTime;
}
