import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Wallpaper>> fetchImages() async {
  final accessKey = 'tgDoR-ZbMar_JuEXLKv0p7uWOdp5D-oOiscn0Fp1Qdw';
  final response = await http.get('https://api.unsplash.com/photos', headers: {HttpHeaders.authorizationHeader: 'Client-ID $accessKey'});

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);

    List<Wallpaper> images = [];
    for (var image in responseJson) {
      images.add(Wallpaper.fromJson(image));
    }
    return images;
  } else {
    throw Exception('Failed to load images');
  }
}

class Wallpaper {
  final String url;

  Wallpaper({this.url});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      url: json['urls']['small'],
    );
  }
}

void main() => runApp(WallpaperApp());

class WallpaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Wallpapers',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpapers'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Wallpaper>>(
        future: fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Image.network(snapshot.data[index].url);
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
