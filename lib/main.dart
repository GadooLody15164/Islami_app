import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/hadeth_details.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/home/my_theme.dart';
import 'package:islami_app/home/tabs/settings.dart';
import 'package:islami_app/sura_details.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SettingsTab.routeName:(context)=>SettingsTab(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(context)=>HadethDetailsScreen(),


      },

    );
  }
}
