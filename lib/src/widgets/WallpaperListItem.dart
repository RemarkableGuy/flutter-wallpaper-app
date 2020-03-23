import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class WallpaperListItem extends StatelessWidget {
  const WallpaperListItem({
    Key key,
    @required this.wallpaper,
  }) : super(key: key);

  final wallpaper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: wallpaper.color,
              blurRadius: 50,
            ),
          ],
        ),
        //TODO Add some extra info like author
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          clipBehavior: Clip.antiAlias,
          child: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            image: wallpaper.url,
          ),
        ),
      ),
    );
  }
}
