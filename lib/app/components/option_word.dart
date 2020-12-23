import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OptionWord extends StatelessWidget {
  final int index;
  final String title;
  final Function(int) handleTap;
  final bool selected;
  OptionWord(
      {Key key,
      @required this.index,
      @required this.title,
      @required this.handleTap,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
              width: 20,
              child: selected
                  ? Container(
                      constraints: BoxConstraints(maxWidth: 20, maxHeight: 22),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow,
                        color: Color(0xff405E7B),
                      ))
                  : Text('')),
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: this.renderButton()),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }

  void handleSelection() {
    this.handleTap(this.index);
  }

  Widget renderButton() {
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: selected ? Color(0xff008AD0) : Color(0xff9B59B6),
        child: AutoSizeText(
          this.title,
          style: TextStyle(color: Colors.white),
          maxLines: 1,
        ),
        onPressed: this.handleSelection,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)));
  }
}
