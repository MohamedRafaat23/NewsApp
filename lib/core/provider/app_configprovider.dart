import 'package:flutter/material.dart';

class AppConfigprovider extends ChangeNotifier{
  
  ThemeMode themeMode=ThemeMode.dark;
  
  void changeTheme(ThemeMode newTheme){
    themeMode=newTheme;
    notifyListeners();
  }
  bool isDark(){
    return themeMode ==ThemeMode.dark;
  }
}