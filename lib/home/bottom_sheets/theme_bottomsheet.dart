import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/my_theme.dart';

class ThemeBottomsheet extends StatelessWidget {
  const ThemeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("Light",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: MyThemeData.primaryColor
                ),),
                Icon(Icons.done,color:MyThemeData.primaryColor,size: 30,),

              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark"),
                // Icon(Icons.done),

              ],
            ),
          ],
        ),
      ),
    );

  }
}
