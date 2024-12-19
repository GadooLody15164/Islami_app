import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetails";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute
        .of(context)
        ?.settings
        .arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/main_bg.png")),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.name,
          ),
        ),
        body: Card(
          margin: EdgeInsets.all(12),
          color: Color(0x80B7935F),
          elevation: 4,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.white,
                  endIndent: 25,
                  indent: 25,
                  thickness: 3,
                );
              },
              itemBuilder: (context, index) {
                return Text(
                  "${verses[index]} ",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.inter(
                      fontSize: 25, fontWeight: FontWeight.w400, color:Colors.white),

                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.trim().split("\n");
    print(suraLines);
    verses = suraLines;
    setState(() {});
  }
}