import 'package:flutter/material.dart';
import 'package:lexus/app/components/photoHero.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/src/photo_view_scale_state.dart';

class PlaceDetails extends StatefulWidget {
  final String placeDescription;
  final String placeTitle;
  final String imgPath;

  PlaceDetails(this.placeDescription, this.placeTitle, this.imgPath);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  bool isZooming = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.placeTitle),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.8,
              color: Colors.green,
              child: PhotoHero(
                scaleChangeCallback: scaleChange,
                usePhotoView: true,
                photo: this.widget.imgPath,
                onTap: () => Navigator.of(context).pop(),
              )),
          this.isZooming
              ? SizedBox(
                  height: 0,
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(this.widget.placeTitle),
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and")
                        ],
                      ),
                    ),
                  ),
                )
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.4,
          //   constraints: BoxConstraints(
          //       maxHeight: MediaQuery.of(context).size.height * 0.4),
          //   alignment: Alignment.bottomCenter,
          //   padding: EdgeInsets.all(60),
          //   color: Colors.white,
          //   child: ,
          // )
        ],
      ),
    );
  }

  void scaleChange(PhotoViewScaleState value) {
    this.setState(() {
      this.isZooming =
          value.isScaleStateZooming || value == PhotoViewScaleState.covering;
    });
  }
}
