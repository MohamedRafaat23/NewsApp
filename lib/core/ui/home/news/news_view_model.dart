import 'package:flutter/material.dart';
import 'package:news_app/core/model/news_responce.dart';
import 'package:news_app/core/network/api/api_maneger.dart';

class NewsViewModel extends ChangeNotifier{
 List<News>? newsList;
  String? errorMessage;
  void getNewsBySourcrId(String sourceId)async{
    newsList=null;
    errorMessage=null;
    notifyListeners();
    try{
     var newsResponce=await ApiManeger.getNewsBySourcrId(sourceId);
     //todo : error
     if(newsResponce.status == 'error'){
      errorMessage=newsResponce.message;
     }
     //todo : sucess
     else{
      newsList=newsResponce.articles;
     }
    }catch(e){
     errorMessage =e.toString();
    }
    notifyListeners();
  }

}