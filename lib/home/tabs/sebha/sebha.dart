import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/theme/my_theme.dart';
import 'package:islami_app/home/provider/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index = 0;
  int tasbehCounter = 0;

  onTap() {
    tasbehCounter++;
    if (tasbehCounter% 33==0) {
      index++;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    setState(() {});
  }
  List<String> tasbeh = [
    "praise God".tr(),
    "thank God".tr(),
    "no god but Allah".tr(),
    "allah is the greatest".tr(),
    "no power nor strength except allah".tr(),
  ];
  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MyProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Image.asset("assets/images/sebha_head.png"),
              ),
              GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .045,
                  ),
                  child: Image.asset("assets/images/sebha_body.png"),
                ),
              ),
            ],
          ),
          Text("praises".tr()),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: mainProvider.mode == ThemeMode.light
                    ? MyThemeData.secoundryColor
                    : MyThemeData.primaryDarkColor),
            child: Text(
              "$tasbehCounter",
              style: GoogleFonts.inter(
                color: mainProvider.mode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                mainProvider.mode==ThemeMode.light?
                MyThemeData.primaryColor:
                MyThemeData.goldColor
            ),
            child: Text(
              tasbeh[index].tr(),
              style: GoogleFonts.inter(color:mainProvider.mode==ThemeMode.light?
              Colors.white:Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
