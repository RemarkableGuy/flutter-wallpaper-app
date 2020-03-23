import 'package:flutter/material.dart';
import 'package:flutterwallpaperapp/src/widgets/WallpaperList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpapers'),
        centerTitle: true,
      ),
      body: WallpaperList(),
    );
  }
}