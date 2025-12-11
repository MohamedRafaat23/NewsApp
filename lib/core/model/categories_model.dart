import 'package:news_app/core/utilse/assees.dart';

class CategoryModel {
  final String id;
  final String categoryName;
  final String lightImage;
  final String darkImage;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.lightImage,
    required this.darkImage,
  });
//business entertainmentgeneralhealthsciencesportstechnology
  static List<CategoryModel> categories = [
      CategoryModel(
      id: "general",
      categoryName: "General",
      lightImage: AppImages.general,
      darkImage: AppImages.generalDark,
    ),
    CategoryModel(
      id: "business",
      categoryName: "Business",
      lightImage: AppImages.busniess,
      darkImage: AppImages.busniessDark,
    ),
  
    CategoryModel(
      id: "sports",
      categoryName: "Sports",
      lightImage: AppImages.sport,
      darkImage: AppImages.sportDark,
    ),
    CategoryModel(
      id: "technology",
      categoryName: "Technology",
      lightImage: AppImages.technology,
      darkImage: AppImages.technologyDark,
    ),
    CategoryModel(
      id: "entertainment",
      categoryName: "Entertainment",
      lightImage: AppImages.entertainment,
      darkImage: AppImages.entertainmentDark,
    ),
    CategoryModel(
      id: "health",
      categoryName: "Health",
      lightImage: AppImages.health,
      darkImage: AppImages.healthDark,
    ),
    
    CategoryModel(
      id: "science",
      categoryName: "Science",
      lightImage: AppImages.science,
      darkImage: AppImages.scienceDark,
    ),
  ];
}
