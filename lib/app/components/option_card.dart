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
          ? Stack(fit: StackFit.loose, children: <Widget>[
              this._buildCardOption(),
              Container(
                color: Color.fromRGBO(114, 188, 212, 98),
              )
            ])
          : this._buildCardOption(),
      onTap: _handleTap,
    );
  }

  Widget _buildCardOption() {
    return Container(
      padding: EdgeInsets.zero,
      child: Card(
        elevation: 5,
        borderOnForeground: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Center(
                widthFactor: 0.4,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 4 / 2,
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: AutoSizeText(description,
                    style: TextStyle(color: Colors.white)),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff9B59B6),
                  border: Border.all(color: Color(0xff9B59B6))),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap() {
    handleTap(index);
  }
}
