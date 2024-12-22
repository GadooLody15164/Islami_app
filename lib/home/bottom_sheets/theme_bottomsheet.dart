import 'package:flutter/material.dart';
import 'package:islami_app/home/theme/my_theme.dart';
import 'package:islami_app/home/provider/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomsheet extends StatelessWidget {
  const ThemeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.light);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: MyThemeData.primaryColor),
                  ),
                  Icon(
                    Icons.done,
                    color: MyThemeData.primaryColor,
                    size: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark"),
                  // Icon(Icons.done),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
