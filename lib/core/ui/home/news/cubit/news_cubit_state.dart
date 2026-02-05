import '../../../../model/news_responce/news.dart';

abstract class NewsState{}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List<News> newsList;
  NewsSuccessState({required this.newsList});
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  NewsErrorState({required this.errorMessage});
} 