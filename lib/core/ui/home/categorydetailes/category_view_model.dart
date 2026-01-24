import 'package:flutter/foundation.dart';
import 'package:news_app/core/model/source_responce.dart';
import 'package:news_app/core/network/api/api_maneger.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    //todo : reinitialize 
    //بفضي الداتا ال عندي اول ما ادخل الفانكشن دي  عشان يقول للكنسيومر ان الداتا ال عندي اتغيرت 
    sourcesList=null;
    errorMessage=null;
    notifyListeners();
    try {
      var sourceResponce = await ApiManeger.getSources(categoryId: categoryId);
      //todo: Error from server
      if (sourceResponce.status == 'error') {
        errorMessage = sourceResponce.message;
      } else {
        //todo : sucsses
        sourcesList = sourceResponce.sources;
      }
    } catch (e) {
      //todo : error from me
      errorMessage = e.toString();
    }
     notifyListeners();

  }
}
