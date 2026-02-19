import 'package:bloc/bloc.dart';
import 'package:news_app/core/network/api/api_maneger.dart';
import 'package:news_app/core/presentaion/home/news/cubit/news_cubit_state.dart';

class NewsViewModelCubit extends Cubit<NewsState> {
  NewsViewModelCubit() : super(NewsInitialState());
   Future<void> getNewsBySourceId(String sourceId) async {
    emit(NewsLoadingState());
    try{
      var response= await ApiManeger.getNewsBySourceId(sourceId);
    if(response.status=='error'){
      emit(NewsErrorState(errorMessage:response.message ?? 'Unknown error'));
    }else{
      emit(NewsSuccessState(newsList: response.articles??[]));
    }
  }catch(e){
    emit(NewsErrorState(errorMessage: e.toString()));
  }
    }
    
}
