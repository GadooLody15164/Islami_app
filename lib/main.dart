import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth_details.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/home/my_theme.dart';
import 'package:islami_app/home/provider/my_provider.dart';
import 'package:islami_app/home/provider/sura_details_provider.dart';
import 'package:islami_app/home/tabs/settings.dart';
import 'package:islami_app/sura_details.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProvider(),),
    ],
      child:  MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
    );
  }
}
