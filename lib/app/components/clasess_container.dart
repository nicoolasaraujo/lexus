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
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: this.widget.title == ''? 0:1,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: this.widget.title == '' ? SizedBox(height: 0,): Text(this.widget.title,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700))),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.all(10),
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
                    padding: EdgeInsets.all(10),
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
    return FlatButton(
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
                          child: Text('Ok'),
                        )
                      ],
                      'Aviso');
                }),
        child: (Text(
          "Confirmar",
          style: TextStyle(color: enable ? Colors.white : Colors.blueGrey),
        )),
        color: enable ? Color(0xff2ed573) : Color.fromRGBO(46, 213, 115, 0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)));
  }
}
