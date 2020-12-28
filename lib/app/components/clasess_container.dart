import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/components/common_dialog.dart';

class ClassesContainer extends StatefulWidget {
  final Widget child;
  final Function confirm;
  final String title;
  final Stream listeningStream;

  ClassesContainer(
      {Key key,
      @required this.child,
      @required this.confirm,
      @required this.title,
      this.listeningStream})
      : super(key: key);

  @override
  _ClassesContainerState createState() => _ClassesContainerState();
}

class _ClassesContainerState extends State<ClassesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Color(0xfff5f5f5),
      padding: EdgeInsets.only(top: this.widget.title == '' ? 10 : 0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: this.widget.title == '' ? 0 : 1,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: this.widget.title == ''
                      ? SizedBox(
                          height: 0,
                        )
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(this.widget.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff5C5757),
                                  fontWeight: FontWeight.w700)),
                        )),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                alignment: Alignment.center,
                child: this.widget.child,
              )),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 2000),
                      child: StreamBuilder(
                        stream: widget.listeningStream,
                        builder: (context, snapshot) {
                          return buildConfirmButton(snapshot.hasData);
                        },
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildConfirmButton(bool enable) {
    return RaisedButton(
        padding: EdgeInsets.all(10),
        onPressed: enable
            ? widget.confirm
            : () => showDialog<void>(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                      'Para avançar é necessário selecionar uma opção',
                      [
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Ok',
                              style: TextStyle(color: Color(0xff9B59B6))),
                        )
                      ],
                      'Aviso');
                }),
        child: (Text(
          "Avançar",
          style: TextStyle(color: enable ? Colors.white : Colors.grey.shade700),
        )),
        color: enable ? Color(0xff00918E) : Colors.grey.shade400,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
  }
}
