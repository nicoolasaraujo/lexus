import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final Function onPressedFunction;
  final Widget label;
  final IconData icon;
  HomeButton(this.icon, this.label, this.onPressedFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Color(0xff9B59B6),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
      child: FlatButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: label,
        onPressed: onPressedFunction,
      ),
    );
  }
}
