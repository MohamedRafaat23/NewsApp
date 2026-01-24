import 'package:flutter/material.dart';
import 'package:news_app/core/model/categories_model.dart';
import 'package:news_app/core/ui/home/categorydetailes/category_view_model.dart';
import 'package:news_app/core/ui/home/categorydetailes/widgets/tapbar_widget.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetails({super.key, required this.category});
  static const String routeName = '/categor';

  @override
  State<CategoryDetails> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryDetails> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
  @override
  void initState() {
    super.initState();
    categoryViewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (context) => categoryViewModel,
      child: Consumer<CategoryViewModel>(
        builder: (context, categoryViewModel, child) {
          //todo : error
          if (categoryViewModel.errorMessage != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryViewModel.errorMessage!),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grey,
                    ),
                    onPressed: () {
                    categoryViewModel.getSources(widget.category.id);
                    },
                    child: Text(
                      "TRy again",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            );
          } else if (categoryViewModel.sourcesList == null) {
            //todo : Loading
            return Center(
              child: CircularProgressIndicator(color: AppColors.grey),
            );
          } else {
            //todo : success
            return TapbarWidget(sourceList: categoryViewModel.sourcesList!);
          }
        },
      ),
    );
  }
}
