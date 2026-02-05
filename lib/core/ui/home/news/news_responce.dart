import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/ui/home/news/cubit/news_cubit_state.dart';
import 'package:news_app/core/ui/home/news/cubit/news_view_model_cubit.dart';
import 'package:news_app/core/ui/home/news/widgets/news_item_card.dart';
import 'package:news_app/core/utilse/app_colors.dart';

import '../../../model/source_response/source.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModelCubit newsViewModel = NewsViewModelCubit();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => newsViewModel..getNewsBySourceId(widget.source.id!),
      child: BlocBuilder<NewsViewModelCubit, NewsState>(
        builder: (context, state) {
          //todo : Error
          if (state is NewsErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grey,
                    ),
                    onPressed: () {
                      context.read<NewsViewModelCubit>().getNewsBySourceId(
                        widget.source.id!,
                      );
                    },
                    child: Text(
                      "TRy again",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is NewsSuccessState) {
            return ListView.separated(
              padding: EdgeInsets.all(height * 0.02),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * .02),
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return NewsItem(news: state.newsList[index]);
              },
            );
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
