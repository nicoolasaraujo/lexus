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
        title: Text("Feira"),
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
                      height: MediaQuery.of(context).size.height * 0.24,
                      margin: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Feira",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Uma feira é um evento em um espaço público em que as pessoas, em dias e épocas predeterminados, expõem e vendem mercadorias. Também é uma designação complementar dos cinco dias úteis da semana: segunda-feira, terça-feira, quarta-feira, quinta-feira e sexta-feira. Pode ser, ainda, uma exposição ou um parque de diversão.",
                              style: TextStyle(height: 1.5, fontSize: 15),
                            )
                          ],
                        ),
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
