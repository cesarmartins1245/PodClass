// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, non_constant_identifier_names

import 'package:audio_teste/ui/video_player/card_video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=7IG5kRFIMZw&ab_';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: false,
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
  Widget build(BuildContext context) => Stack(
        children: [
          YoutubePlayer(controller: controller),
          Scaffold(
            body: Container(
              color: Colors.grey.shade800,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CardVideoYt(),
                  SizedBox(
                    height: 16,
                  ),
                  ControllerBar(),
                ],
              ),
            ),
          ),
        ],
      );

  Card ControllerBar() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.skip_previous_sharp,
              size: 30,
            ),
            onPressed: () {
              const url =
                  'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=JohannesMilke';
              controller.load(YoutubePlayer.convertUrlToId(url)!);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.replay_10_sharp,
              size: 30,
            ),
            onPressed: () {
              const url =
                  'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=JohannesMilke';
              controller.load(YoutubePlayer.convertUrlToId(url)!);
            },
          ),
          IconButton(
            icon: Icon(
              (_isPlaying == false) ? Icons.play_arrow_sharp : Icons.pause,
              size: 35,
            ),
            onPressed: () {
              (_isPlaying == false) ? controller.play() : controller.pause();
              (_isPlaying == false)
                  ? (_isPlaying = true)
                  : (_isPlaying = false);
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(
              Icons.forward_10_sharp,
              size: 30,
            ),
            onPressed: () {
              const url =
                  'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=JohannesMilke';
              print(YoutubePlayer.convertUrlToId(url)!);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.skip_next_sharp,
              size: 30,
            ),
            onPressed: () {
              const url =
                  'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=JohannesMilke';
              controller.load(YoutubePlayer.convertUrlToId(url)!);
            },
          ),
        ],
      ),
    );
  }
}
