import 'package:flutter/material.dart';
import 'package:news_app/core/model/categories_model.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/presentaion/home/pages/widget/category_card.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';
//call back function
typedef OnCategoryClick = void Function(CategoryModel category);
// ignore: must_be_immutable
class CategoriesPage extends StatelessWidget {
   OnCategoryClick onCategoryClick;
   CategoriesPage({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var appConfigprovider = Provider.of<AppConfigprovider>(context);
    return ListView.separated(
      itemCount: CategoryModel.categories.length + 1,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            "Good Morning\nHere is Some News For You",
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: appConfigprovider.isDark()?AppColors.white:AppColors.black),
          
          );
        } else {
          return  
          InkWell(
            onTap: (){
              // call function
            onCategoryClick(CategoryModel.categories[index-1]);
            },
            child: 
          CategoryCard(category: CategoryModel.categories[index - 1], index: (index-1) ,));
        }
      },
  
    );
  }
}
