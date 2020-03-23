import 'package:flutter/material.dart';
import 'package:flutterwallpaperapp/src/models/Wallpapers.dart';
import 'package:flutterwallpaperapp/src/widgets/HomePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(WallpaperApp());

//TODO: Implement 'set as wallpaper' feature
class WallpaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO: Think of a nice title
      title: 'Wallpaper App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<Wallpapers>(
        create: (context) => Wallpapers(),
        child: HomePage(),
      ),
    );
  }
}
