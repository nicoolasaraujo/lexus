import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassesContainer extends StatelessWidget {
  final Widget child;
  final Function confirm;
  final String title;

  ClassesContainer(
      {Key key,
      @required this.child,
      @required this.confirm,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text("Selecione um localx",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: this.child,
              )),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: this.confirm,
                      child: (Text(
                        "Confirmar",
                        style: TextStyle(color: Colors.white),
                      )),
                      color: Color(0xff2ed573),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
              ),
            ),
          )
        ],
      ),
    );
 
  }
}
