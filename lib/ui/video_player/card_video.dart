// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardVideoYt extends StatelessWidget {
  const CardVideoYt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Card(
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Image.network('https://picsum.photos/170/170'),
          ),
          Text(
            'Titulo',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Autor',
            style: TextStyle(fontSize: 8),
          )
        ],
      ),
    );
  }
}
