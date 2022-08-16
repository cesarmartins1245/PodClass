// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:audio_teste/services/firebase_api.dart';
import 'package:audio_teste/ui/teste/button_widget/button_widget.dart';
import 'package:audio_teste/ui/teste/video_player.dart';
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
    super.initState();
  }

  // loadVideoPlayer() async {
  //   // FirebaseStorage storage = FirebaseStorage.instance;
  //   // Reference ref = storage.ref().child("files/VID-20220418-WA0005.mp4");
  //   // ref.getDownloadURL();
  //   controller = VideoPlayerController.network(
  //       "https://firebasestorage.googleapis.com/v0/b/podclass-7089a.appspot.com/o/files%2FVID-20210910-WA0005.mp4?alt=media&token=ca879af7-82b5-4d93-b685-51c7fcb96093");
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  //   controller.initialize().then((value) {
  //     controller.play();
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'no file selected';
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste video/audio'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
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
              // videoPlayer(),
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
    setState(
      () {
        file = File(path);
      },
    );
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
