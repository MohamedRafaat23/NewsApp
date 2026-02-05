import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/model/categories_model.dart';
import 'package:news_app/core/ui/home/categorydetailes/cubit/category_cubit_state.dart';
import 'package:news_app/core/ui/home/categorydetailes/cubit/category_view_model.dart';
import 'package:news_app/core/ui/home/categorydetailes/widgets/tapbar_widget.dart';
import 'package:news_app/core/utilse/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final CategoryViewModel viewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      create: (_) => viewModel..getSources(widget.category.id),
      child: BlocBuilder<CategoryViewModel, CategoryCubitState>(
        builder: (context, state) {
          if (state is CategoryErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  onPressed: () {
                    context
                        .read<CategoryViewModel>()
                        .getSources(widget.category.id);
                  },
                  child: const Text("Try again"),
                ),
              ],
            );
          } else if (state is CategorySuccessState) {
            return TapbarWidget(sourceList: state.sourcesList);
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.grey),
            );
          } 
        },
      ),
    );
  }
}
