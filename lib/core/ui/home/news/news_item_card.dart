import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/model/news_responce.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:news_app/core/utilse/app_style.dart';
import 'package:provider/provider.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var appconfigprovider=Provider.of<AppConfigprovider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.02
      ),
      margin:EdgeInsets.symmetric(
        horizontal: 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appconfigprovider.isDark()?AppColors.white:AppColors.black,
        width: width*0.01
         ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height:height*0.02),
          Text(news.title ?? "" ,style: Theme.of(context).textTheme.labelLarge,),
           SizedBox(height:height*0.01),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('By:${news.author ?? ""}',style: AppStyles.medium12Gray,)),
              Text(news.publishedAt ?? "",style: AppStyles.medium12Gray,),
            ],
          ),
        ],
      ),
    );
  }
}
