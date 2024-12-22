import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/theme/my_theme.dart';
import 'package:islami_app/home/provider/sura_details_provider.dart';
import 'package:islami_app/models/sura_model/sura_model.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "suraDetails";

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
        builder: (context, child) {
          var provider = Provider.of<SuraDetailsProvider>(context);
          var mainProvider = Provider.of<MyProvider>(context);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(mainProvider.mode == ThemeMode.light
                      ? "assets/images/main_bg.png"
                      : "assets/images/main_dark_bg.png")),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  model.name,
                ),
              ),
              body: Card(
                margin: EdgeInsets.all(12),
                color: mainProvider.mode == ThemeMode.light
                    ? Color(0x9BA88B60)
                    : MyThemeData.primaryDarkColor,
                elevation: 4,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.white,
                        endIndent: 25,
                        indent: 25,
                        thickness: 3,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Text(
                        "${provider.verses[index]} ",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: mainProvider.mode == ThemeMode.light
                              ? Colors.white
                              : MyThemeData.goldColor,
                        ),
                      );
                    },
                    itemCount: provider.verses.length,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
