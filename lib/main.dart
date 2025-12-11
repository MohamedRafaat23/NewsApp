import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/ui/home/home_screen.dart';
import 'package:news_app/core/ui/splash/splash_screen.dart';
import 'package:news_app/core/utilse/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
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
