import 'package:flutter/material.dart';

class CardVideo {
  int id = 0;
  String url = '';
  String titulo = '';
  String autor = '';

  CardVideo(
      {required this.id,
      required this.url,
      required this.titulo,
      required this.autor});

  CardVideo.fromJson(Map<String, dynamic> json) {
    this.id = json[''];
    this.url = json[''];
    this.titulo = json[''];
    this.autor = json[''];
  }
}
