import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/hadeth_model/Hadeth_model.dart';
import 'package:islami_app/home/theme/my_theme.dart';
import 'package:islami_app/home/provider/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName="HadethScreen";
  const HadethDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    var mainProvider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
            mainProvider.mode==ThemeMode.light?
            "assets/images/main_bg.png"
              :"assets/images/main_dark_bg.png")),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body:Card(
          color: mainProvider.mode == ThemeMode.light
              ? Color(0x9BA88B60)
              : MyThemeData.primaryDarkColor,
          margin: EdgeInsets.all(12),
          elevation: 4,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25)
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: model.content.length,
                itemBuilder:(context,index){
              return Text(model.content[index],
                textDirection: TextDirection.rtl,
                style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                  color: mainProvider.mode == ThemeMode.light
                      ? Colors.white
                      : MyThemeData.goldColor,
              ),);
            }),
          ),
        ) ,
      ),
    );
  }
}
