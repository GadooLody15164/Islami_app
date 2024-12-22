import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/radio/radio_item.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/models/radio_model/radio_model.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRadios(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var radios = snapshot.data?.radios ?? [];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/radio_image.png"),
                SizedBox(
                  height: 30,
                ),
                Text("holy_quran_radio".tr()),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .25,
                  child: ListView.builder(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: radios.length,
                      itemBuilder: (context, index) {
                        return RadioItem(
                          radio: radios[index],
                          audioplayer: player,
                        );
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<RadioModel> getRadios() async {
    var url = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RadioModel.fromJson(json);
    } else {
      throw Exception("failed loading radios");
    }
  }
}
