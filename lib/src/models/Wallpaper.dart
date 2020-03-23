import 'package:flutter/material.dart';

class Wallpaper {
  final String url;
  final Color color;

  Wallpaper({this.url, this.color});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      url: json['urls']['regular'],
      color: Color(int.parse(json['color'].replaceAll('#', '0x7F'))),
    );
  }
}
