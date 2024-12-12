import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Hadeth_model.dart';
import 'package:islami_app/home/hadeth_details.dart';
import 'package:islami_app/home/my_theme.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      LoadHadethFile();
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Image.asset(
        "assets/images/hadith_bg.png",
        height: 219,
      ),
      Divider(
        thickness: 3,
      ),
      Text(
        "Ahadeth",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium
      ),
      Divider(
        thickness: 3,
      ),
      Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.star,
                          color: Color(0xFFB7935F),
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Divider(
                        color: MyThemeData.primaryColor
                    ),
                  ),
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(
                          Icons.star,
                          color: Color(0xFFB7935F),
                        ),
                      )),
                ],
              );
            },
            itemCount: allAhadeth.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              );
            }),
      )
    ]);
  }

  LoadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");
      for (int i = 0; i < ahadeth.length; i++) {
        String HadethOne = ahadeth[i];
        List<String> HadethLines = HadethOne.trim().split("\n");
        String title = HadethLines[0];
        HadethLines.removeAt(0);
        List<String> content = HadethLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
        print(hadethModel.title);
      }
      setState(() {});
    });
  }
}
