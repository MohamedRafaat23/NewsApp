import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/presentaion/home/home_screen.dart';
import 'package:news_app/core/utilse/assees.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
static const String routeName='splash';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
  var appconfigprovider=Provider.of<AppConfigprovider>(context);
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
          appconfigprovider.isDark()?AppImages.miceDark:AppImages.mice
              ),
          )
        ],
      ),
    );
  }
}