import 'package:flutter/material.dart';
import 'package:news_app/core/model/categories_model.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryCard({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var even = index % 2 == 0;
    var appConfigprovider = Provider.of<AppConfigprovider>(context);
    return AspectRatio(
      aspectRatio: 2370 / 1280,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              appConfigprovider.isDark()
                  ? category.lightImage
                  : category.darkImage,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: even
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              category.categoryName,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: appConfigprovider.isDark()
                    ? AppColors.black
                    : AppColors.white,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(even)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: appConfigprovider.isDark()
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appConfigprovider.isDark()
                          ? Colors.black
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      even
                          ? Icons.arrow_forward_ios_outlined
                          : Icons.arrow_back_ios_new_outlined,
                      color: appConfigprovider.isDark()
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  if(!even)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: appConfigprovider.isDark()
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
