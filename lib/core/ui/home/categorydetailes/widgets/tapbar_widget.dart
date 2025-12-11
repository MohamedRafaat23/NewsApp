import 'package:flutter/material.dart';
import 'package:news_app/core/model/source_responce.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/ui/home/categorydetailes/widgets/source_name_list.dart';
import 'package:news_app/core/ui/home/news/news_responce.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';

class TapbarWidget extends StatefulWidget {
  final List<Source> sourceList;

  const TapbarWidget({super.key, required this.sourceList});

  @override
  State<TapbarWidget> createState() => _TapbarWidgetState();
}

class _TapbarWidgetState extends State<TapbarWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
       var appconfigprovider=Provider.of<AppConfigprovider>(context);
    return DefaultTabController(
            length: widget.sourceList.length,
            child: Column(
              children: [
                TabBar(
                  tabAlignment: TabAlignment.start,
                  dividerColor: AppColors.transparent,
                  indicatorColor:appconfigprovider.isDark()?AppColors.white:AppColors.black,
                  isScrollable: true,
                  onTap: (index){
                    selectedIndex=index;
                    setState(() {

                    });
                  },
                  tabs: widget.sourceList.map((source) {
                    return SourceNameList(
                    isSelected: selectedIndex==widget.sourceList.indexOf(source),
                    source: source
                    );
                  }).toList(),
                ),
                 Expanded(child: TabBarView(
                  children:
               widget.sourceList.map((source) {
                return NewsWidget(source:source);
              }).toList(),
                ))
              ],
            ),
          );


  }
}
