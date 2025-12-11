import 'package:flutter/material.dart';
import 'package:news_app/core/model/categories_model.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/ui/home/categorydetailes/category_details.dart';
import 'package:news_app/core/ui/home/pages/categories_page.dart';
import 'package:news_app/core/ui/home/widget/drawer_widget.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  void onCategoryClick(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerIitemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var appConfigprovider = Provider.of<AppConfigprovider>(context);
    return Scaffold(
      drawer: DrawerWidget(onDrawerIitemClick: onDrawerIitemClick),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedCategory==null? 
          "Home":selectedCategory!.categoryName,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: appConfigprovider.isDark()
                ? AppColors.white
                : AppColors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: appConfigprovider.isDark()
                  ? AppColors.white
                  : AppColors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body: selectedCategory == null
          ? CategoriesPage(
              //pass function as a parameter
              onCategoryClick: onCategoryClick,
            )
          : CategoryDetails(category: selectedCategory!),
    );
  }
}
