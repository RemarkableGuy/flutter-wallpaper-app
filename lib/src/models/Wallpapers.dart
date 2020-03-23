import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterwallpaperapp/src/models/Wallpaper.dart';
import 'package:http/http.dart' as http;

class Wallpapers with ChangeNotifier {
  List<Wallpaper> _wallpapers = [];
  int _requestedPageNum = 1;

  Wallpapers() {
    setWallpapers();
  }

  get wallpapers => _wallpapers;

  set wallpapers(List<Wallpaper> wallpapers) {
    _wallpapers = wallpapers;
    notifyListeners();
  }

  void setWallpapers() async {
    wallpapers = await _fetchWallpapers();
  }

  //TODO: Implement proper pagination https://unsplash.com/documentation#pagination
  void nextPage() async {
    print('NEXT PAGE');
    _requestedPageNum++;
    _wallpapers.addAll(await _fetchWallpapers(pageNum: _requestedPageNum));
    notifyListeners();
  }

  Future<List<Wallpaper>> _fetchWallpapers({int pageNum: 1}) async {
    final collectionId = 1065976;
    final orientation = 'portrait';
    final perPage = 30;
    final accessKey = 'tgDoR-ZbMar_JuEXLKv0p7uWOdp5D-oOiscn0Fp1Qdw';
    final response = await http.get('https://api.unsplash.com/collections/$collectionId/photos?orientation=$orientation&page=$pageNum&per_page=$perPage',
        headers: {HttpHeaders.authorizationHeader: 'Client-ID $accessKey'});

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
}
