import 'package:flutter/material.dart';
import 'package:islami_app/home/bottom_sheets/language_bottomsheet.dart';
import 'package:islami_app/home/bottom_sheets/theme_bottomsheet.dart';
import 'package:islami_app/home/theme/my_theme.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName = "settingsScreen";

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Theme"),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return ThemeBottomsheet();
                  });
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text("Light"),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Text("Language"),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: true,
                  context: context,
                  builder: (context) {
                    return LanguageBottomsheet();
                  });
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text("Arabic"),
            ),
          ),
        ],
      ),
    );
  }
}
