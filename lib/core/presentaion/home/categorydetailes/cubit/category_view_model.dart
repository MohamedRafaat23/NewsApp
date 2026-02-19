import 'package:bloc/bloc.dart';
import 'package:news_app/core/network/api/api_maneger.dart';
import 'package:news_app/core/presentaion/home/categorydetailes/cubit/category_cubit_state.dart';

class CategoryViewModel extends Cubit<CategoryCubitState> {
  CategoryViewModel() : super(CategoryInitialState());
  void getSources(String categoryId) async {
    try {
      emit(CategoryLoadingState());
      var response  = await ApiManeger.getSources(categoryId: categoryId);
      if (response .status == 'error') {
        emit(
          CategoryErrorState(errorMessage: response.message ?? 'Unknown error'),
        );
      } else {
        emit(CategorySuccessState(sourcesList: response .sources ?? []));
      }
    } catch (e) {
      //todo :error =>user
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
}
