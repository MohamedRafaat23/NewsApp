import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/model/categories_model.dart';
import 'package:news_app/core/model/source_responce.dart';
import 'package:news_app/core/network/api/api_maneger.dart';
import 'package:news_app/core/network/api/app_exception.dart';
import 'package:news_app/core/ui/home/categorydetailes/widgets/tapbar_widget.dart';
import 'package:news_app/core/utilse/app_colors.dart';

class CategoryDetails extends StatefulWidget {
 final CategoryModel category;
  const CategoryDetails({super.key, required this.category});
  static const String routeName = '/categor';

  @override
  State<CategoryDetails> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryDetails> {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce>(
      //call api
      future: ApiManeger.getSources(categoryId:widget.category.id),
      builder: (context, snapshot) {
        //todo :loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.grey),
          );
        }
        //todo : error => error from client and from server 
        else if (snapshot.hasError) {
          String errorMessage;
          // object=>is DioException     
          //  object (DioException) =>check error is type of => AppException   
          // اللفه دي كلها عشان Message  موجوده داخل كلاس  AppException
          if(snapshot.error is DioException &&
           (snapshot.error as DioException).error is AppException ){
            //parsing DioException obj (message)=> AppException obj(message)
            //يعني انا جايلي اصلا DioException ف عايز احوله AppException الي هي (message) 
            errorMessage=((snapshot.error as DioException).error as AppException).message ;
            
           }else{
            errorMessage=snapshot.error.toString();
           }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(errorMessage),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  onPressed: () {
                    ApiManeger.getSources(categoryId: widget.category.id);
                    setState(() {});
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
        //  دا كله كدا ملوش لازمه عشان اناهندلته فوق داخل AppException
        // //todo : server => responce => sucess , error
        // //todo : server => responce =>  error from server
        // else if (snapshot.data?.status == 'error') {
        //   return Column(
        //     children: [
        //       Text(snapshot.data!.message!),
        //       Center(
        //         child: ElevatedButton(
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: AppColors.grey,
        //           ),
        //           onPressed: () {
        //             ApiManeger.getSources(categoryId: widget.category.id);
        //             setState(() {});
        //           },
        //           child: Text(
        //             "TRy again",
        //             style: Theme.of(context).textTheme.labelMedium,
        //           ),
        //         ),
        //       ),
        //     ],
        //   );
        // }
        else if(snapshot.hasData){
        var sourceList = snapshot.data?.sources;
          if(sourceList ==null || sourceList.isEmpty ){
            return Center(child:
             Text("No Sources Found",  style: Theme.of(context).textTheme.labelMedium,),);
          }else {
            //todo : server => responce => sucess
              return TapbarWidget(sourceList: sourceList);
          }
        }
        //لو مدخلتش في كل دول رجعلي دا 
        else{
          return  Center(child:
             Text("Starting fetching source",  style: Theme.of(context).textTheme.labelMedium,),);
        }

      
      },
    );
  }
}
