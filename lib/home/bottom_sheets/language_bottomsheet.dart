import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/theme/my_theme.dart';

class LanguageBottomsheet extends StatelessWidget {
  const LanguageBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("arabic".tr(),
                      style: context.locale == Locale("ar")
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: MyThemeData.primaryColor)
                          : Theme.of(context).textTheme.bodyMedium),
                  context.locale == Locale("ar")
                      ? Icon(
                          Icons.done,
                          color: MyThemeData.primaryColor,
                          size: 30,
                        )
                      : SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("english".tr(),
                      style: context.locale != Locale("ar")
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: MyThemeData.primaryColor)
                          : Theme.of(context).textTheme.bodyMedium),
                  context.locale == Locale("en")
                      ? Icon(Icons.done)
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
