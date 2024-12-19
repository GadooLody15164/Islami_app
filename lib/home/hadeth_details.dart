import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName="HadethScreen";
  const HadethDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/main_bg.png")),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body:Card(
          margin: EdgeInsets.all(12),
          color: Color(0x80B7935F),
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
                  color: Colors.white
              ),);
            }),
          ),
        ) ,
      ),
    );
  }
}
