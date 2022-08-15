// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:audio_teste/services/firebase_api.dart';
import 'package:audio_teste/ui/teste/button_widget/button_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:video_player/video_player.dart';

class FireBasePage extends StatefulWidget {
  const FireBasePage({Key? key}) : super(key: key);

  @override
  State<FireBasePage> createState() => _FireBasePageState();
}

class _FireBasePageState extends State<FireBasePage> {
  UploadTask? task;
  File? file;
  late VideoPlayerController controller;
  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    // FirebaseStorage storage = FirebaseStorage.instance;
    // Reference ref = storage.ref().child(pathname )
    controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=dmZ9Tg9k13U&ab_channel=JohannesMilke');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'no file selected';
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste video/audio'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                icon: Icons.attach_file,
                text: 'Select file',
                onClicked: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16),
              ),
              ButtonWidget(
                icon: Icons.cloud_upload,
                text: 'Upload file',
                onClicked: uploadFile,
              ),
              AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
              Text("Total Duration: " + controller.value.duration.toString()),
              VideoProgressIndicator(controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.redAccent,
                    playedColor: Colors.green,
                    bufferedColor: Colors.purple,
                  )),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (controller.value.isPlaying) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                        setState(() {});
                      },
                      icon: Icon(controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow)),
                  IconButton(
                      onPressed: () {
                        controller.seekTo(Duration(seconds: 0));
                        setState(
                          () {},
                        );
                      },
                      icon: Icon(Icons.stop)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    // print('Download-Link> $urlDownload');
  }
}
