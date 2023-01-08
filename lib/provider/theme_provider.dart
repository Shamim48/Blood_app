
import 'package:blood_app/utils/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
   SharedPreferences sharedPreferences;
  ThemeProvider({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(AppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  int colorIndex=0;
  int get getColorIndex=>colorIndex;

  int circleColorIndex=0;
  int get getCircleColorIndex=>circleColorIndex;


  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(AppConstants.THEME) ?? true;
    notifyListeners();
  }

  void setColorIndex(int index){
    colorIndex=index;
    notifyListeners();
  }
   void setCircleColorIndex(int index){
     circleColorIndex=index;
    notifyListeners();
  }


}
