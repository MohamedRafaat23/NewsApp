import 'package:flutter/material.dart';
import 'package:news_app/core/model/source_responce.dart';
import 'package:news_app/core/ui/home/news/news_item_card.dart';
import 'package:news_app/core/ui/home/news/news_view_model.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel newsViewModel=NewsViewModel();
  @override
  void initState() {
    super.initState();
    newsViewModel.getNewsBySourcrId(widget.source.id!);
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<NewsViewModel>(
      create: (context)=>newsViewModel,
      child: Consumer<NewsViewModel>(
        builder:( context, newsViewModel ,child) {
          //todo : error
        if(newsViewModel.errorMessage !=null){
        return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(newsViewModel.errorMessage!),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grey,
                    ),
                    onPressed: () {
                    newsViewModel.getNewsBySourcrId(widget.source.id??"");
                    },
                    child: Text(
                      "TRy again",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            );
            }
            //todo : loding (list is empty)
            else if(newsViewModel.newsList==null){
              return Center(
              child: CircularProgressIndicator(color: AppColors.grey),
            );
            }
            //todo : success
            else {
              return ListView.separated(
                padding: EdgeInsets.all(height * 0.02),
                separatorBuilder: (context, index) =>
                    SizedBox(height: height * .02),
                itemCount: newsViewModel.newsList!.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: newsViewModel.newsList![index]);
                },
              );
            
          

            }
  })
    );
  }
      // child: FutureBuilder<NewsResponce>(
      //   future: ApiManeger.getNewsBySourcrId(widget.source.id ?? ''),
      //   builder: (context, snapshot) {
      //     //todo :loading
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator(color: AppColors.grey);
      //     }
      //     //todo : error=>client error
      //     else if (snapshot.hasError) {
      //       String errorMessage;
      //       String snapShotError = snapshot.error.toString();
      //       if (snapShotError is DioException &&
      //           (snapShotError as DioException).error is AppException) {
      //         errorMessage =
      //             ((snapShotError as DioException).error as AppException).message;
      //       } else {
      //         errorMessage = snapshot.error.toString();
      //       }
             
      //     } else if (snapshot.hasData) {
      //       var newsList = snapshot.data!.articles;
      //       if (newsList == null || newsList.isEmpty) {
      //         return Center(
      //           child: Text(
      //             "No News Found",
      //             style: Theme.of(context).textTheme.labelMedium,
      //           ),
      //         );
      //       } else {
      //         return ListView.separated(
      //           padding: EdgeInsets.all(height * 0.02),
      //           separatorBuilder: (context, index) =>
      //               SizedBox(height: height * .02),
      //           itemCount: newsList.length,
      //           itemBuilder: (context, index) {
      //             return NewsItem(news: newsList[index]);
      //           },
      //         );
      //       }
      //     }
      //     //لو مدخلتش في كل دول رجعلي دا
      //     else {
      //       return Center(
      //         child: Text(
      //           "Starting fetching source",
      //           style: Theme.of(context).textTheme.labelMedium,
      //         ),
      //       );
      //     }
      //   },
      // ),
}
