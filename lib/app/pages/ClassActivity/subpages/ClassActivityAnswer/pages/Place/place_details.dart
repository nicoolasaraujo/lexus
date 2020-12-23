import 'package:flutter/material.dart';
import 'package:lexus/app/components/photoHero.dart';

class PlaceDetails extends StatelessWidget {
  String placeDescription;
  String placeTitle;
  String imgPath;
  PlaceDetails(this.placeDescription, this.placeTitle, this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.placeTitle)),
      body: Container(
          color: Colors.black,
          child: PhotoHero(
            photo: this.imgPath,
            onTap: () => Navigator.of(context).pop(),
            width: 800,
          )),
    );
  }
}
