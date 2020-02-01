import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionCard extends StatelessWidget {
  final index;
  final bool selected;
  final String imagePath;
  final String description;
  final Function handleTap;

  OptionCard(
      {Key key,
      @required this.imagePath,
      @required this.description,
      this.selected = false,
      @required this.handleTap,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: selected
          ? Stack(
            children: <Widget>[
              
              this._buildCardOption(),
              Container(
                color: Color.fromRGBO(114, 188, 212, 98),
              )
            ])
          : this._buildCardOption(),
      onTap: _handleTap,
    );
  }

  Card _buildCardOption() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Center(
              widthFactor: 0.4,
              child: 
              Padding(
                padding: EdgeInsets.all(0),
                child: Image.asset(imagePath,
                  height: 100, width: 200, fit: BoxFit.scaleDown) ,
              ),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: AutoSizeText(description, style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
            decoration: BoxDecoration(color: Color(0xff9B59B6)),
          ),
        ],
      ),
    );
  }

  void _handleTap() {
    handleTap(index);
  }
}
