import 'package:news_app/core/model/source_responce.dart';

abstract class CategoryCubitState {}

class CategoryInitialState extends CategoryCubitState {}

class CategoryLoadingState extends CategoryCubitState {}

class CategorySuccessState extends CategoryCubitState {
  final List<Source> sourcesList;
  CategorySuccessState({required this.sourcesList});
}

class CategoryErrorState extends CategoryCubitState {
  final String errorMessage;
  CategoryErrorState({required this.errorMessage});
}
