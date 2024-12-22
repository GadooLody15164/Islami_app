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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("Arabic",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: MyThemeData.primaryColor
                ),),
                Icon(Icons.done,color:MyThemeData.primaryColor,size: 30,),

              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English"),
                // Icon(Icons.done),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
