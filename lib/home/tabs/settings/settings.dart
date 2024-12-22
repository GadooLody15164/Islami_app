import 'package:easy_localization/easy_localization.dart';
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
          Text("theme".tr()),
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
              child: Text("light".tr()),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Text("language".tr()),
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
              child: Text("arabic".tr()),
            ),
          ),
        ],
      ),
    );
  }
}
