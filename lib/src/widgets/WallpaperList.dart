import 'package:flutter/material.dart';
import 'package:flutterwallpaperapp/src/models/Wallpapers.dart';
import 'package:flutterwallpaperapp/src/widgets/WallpaperListItem.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:provider/provider.dart';

class WallpaperList extends StatefulWidget {
  @override
  _WallpaperListState createState() => _WallpaperListState();
}

class _WallpaperListState extends State<WallpaperList> {
  var _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels > _controller.position.maxScrollExtent * 0.75) {
        Debounce.seconds(1, Provider.of<Wallpapers>(context, listen: false).nextPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Wallpapers>(
      builder: (context, wallpapers, child) {
        //TODO: Add some nice animations
        return ListView.builder(
          controller: _controller,
          itemCount: wallpapers.wallpapers.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var wallpaper = wallpapers.wallpapers[index];
            return WallpaperListItem(wallpaper: wallpaper);
          },
        );
      },
    );
  }
}