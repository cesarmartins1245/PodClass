// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videoPlayer extends StatefulWidget {
  const videoPlayer({Key? key}) : super(key: key);

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=7IG5kRFIMZw&ab_';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(controller: controller),
        builder: (context, player) => Scaffold(
          appBar: AppBar(title: Text('youtube player')),
          body: ListView(
            children: [
              player,
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                child: Text('Next Video'),
                onPressed: () {
                  const url =
                      'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=JohannesMilke';
                  controller.load(YoutubePlayer.convertUrlToId(url)!);
                },
              )
            ],
          ),
        ),
      );
}
