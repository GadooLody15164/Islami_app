import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/provider/my_provider.dart';
import 'package:islami_app/home/tabs/hadeth/hadith.dart';
import 'package:islami_app/home/tabs/quran/quran.dart';
import 'package:islami_app/home/tabs/sebha/sebha.dart';
import 'package:islami_app/home/tabs/radio/radio.dart';
import 'package:islami_app/home/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(provider.mode == ThemeMode.light
            ? "assets/images/main_bg.png"
            : "assets/images/main_dark_bg.png"),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/moshaf.png")),
                    label: " "),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: " "),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: " "),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/hadith.png")),
                    label: " "),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
              ]),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("islami".tr(), style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: tabs[selectedindex],
        ),
      ],
    );
  }
}
List<Widget> tabs = [
  QuranTab(),
  SebhaTab(),
  RadioTab(),
  AhadethTab(),
  SettingsTab(),
];
