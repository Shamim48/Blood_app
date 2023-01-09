
import 'package:blood_app/utils/color_resources.dart';
import 'package:blood_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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


class Custom_Gridview extends StatelessWidget {
  final Image image;
  final String title;
  Function onTab;

  Custom_Gridview({Key? key, required this.image, required this.title, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => onTab()));
      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black)
            ),
            padding: const EdgeInsets.all(15),
            child: image,
          ),
          SizedBox(height: 5,),
          Container(
              height: 20,

              child: Text(title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color:Colors.black87),))
        ],
      ),
    );
  }
}


