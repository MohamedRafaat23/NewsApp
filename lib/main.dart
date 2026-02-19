import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/network/bloc_observer/my_bloc_observer.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/presentaion/home/home_screen.dart';
import 'package:news_app/core/presentaion/splash/splash_screen.dart';
import 'package:news_app/core/utilse/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigprovider(),
      child: MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key});
late AppConfigprovider appConfigprovider;
  @override
  Widget build(BuildContext context) {
    appConfigprovider=Provider.of<AppConfigprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: appConfigprovider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
     

      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) =>  HomeScreen(),
       
      },

      initialRoute: SplashScreen.routeName,
    );
  }
}
