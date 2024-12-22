import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:islami_app/home/provider/my_provider.dart';
import 'package:islami_app/models/radio_model/radio_model.dart';
import 'package:provider/provider.dart';
import '../../theme/my_theme.dart';

class RadioItem extends StatefulWidget {
  final Radio radio;
  final AudioPlayer audioplayer;

  const RadioItem({super.key, required this.radio, required this.audioplayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MyProvider>(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Text(widget.radio.name ?? ""),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  await widget.audioplayer.play(UrlSource(widget.radio.url!));
                  setState(() {});
                },
                icon: Icon(
                  widget.audioplayer.state == PlayerState.playing
                      ? Icons.pause
                      : Icons.play_arrow,
                  size: 40,
                  color: mainProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.goldColor,
                ),
              ),
              IconButton(
                  onPressed: () {
                    widget.audioplayer.stop();
                  },
                  icon: Icon(
                    Icons.stop,
                    size: 40,
                    color: mainProvider.mode == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.goldColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
