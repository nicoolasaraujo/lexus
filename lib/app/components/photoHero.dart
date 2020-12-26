import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key key,
      this.photo,
      this.onTap,
      this.width,
      this.usePhotoView,
      this.scaleChangeCallback})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final bool usePhotoView;
  final ValueChanged<PhotoViewScaleState> scaleChangeCallback;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onTap,
              child: this.usePhotoView
                  ? Container(
                      child: PhotoView(
                      imageProvider: AssetImage(this.photo),
                      scaleStateChangedCallback: scaleChangeCallback,
                    ))
                  : Image.asset(
                      photo,
                      fit: BoxFit.contain,
                    )),
        ),
      ),
    );
  }
}
