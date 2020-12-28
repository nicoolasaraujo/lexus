import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/components/common_dialog.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/pages/FinishedClass/finishedClass_page.dart';
import 'class_bloc.dart';
import 'class_module.dart';
import 'pages/Clothes/Clothes_pages.dart';
import 'pages/Place/place_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'pages/Gender/gender_page.dart';
import 'pages/Situation/situation_page.dart';

class ClassAnswerPage extends StatefulWidget {
  @override
  _ClassAnswerPage createState() => _ClassAnswerPage();
}

class _ClassAnswerPage extends State<ClassAnswerPage> {
  final classActy = ClassAnswerModule.to.getBloc<ClassAnswerBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: StreamBuilder<int>(
                stream: this.classActy.outIsLoadedSituation,
                builder: (context, snapshot) {
                  return !snapshot.hasData || snapshot.data <= 0
                      ? Text(
                          classActy.classAcBloc.selectedActivity.description,
                          style: TextStyle(color: Color(0xff5C5757)),
                        )
                      : this.status(context);
                }),
            leading: new IconButton(
              icon: new Icon(
                Icons.close,
                color: Color(0xff5C5757),
              ),
              // onPressed: () => Navigator.of(context).pop(),
              onPressed: () async {
                var response = await dialogLeaveClass();
                if (response == null) {
                  response = false;
                }
                if (response) Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 5),
                child: Navigator(
                  onGenerateRoute: (settings) => generateRoute(settings),
                  initialRoute: '/class/gender',
                ),
              ),
            )
          ],
        ));
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/class/gender':
        return MaterialPageRoute(builder: (_) => GenderPage());
      case '/class/place':
        return MaterialPageRoute(builder: (_) => PlacePage());
      case '/class/Clothes':
        return MaterialPageRoute(builder: (_) => ClothesPage());
      case '/class/situation':
        return MaterialPageRoute(builder: (_) => SituationPage());
      case '/class/finished':
        return MaterialPageRoute(builder: (_) => FinishedClass());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  Widget status(BuildContext contextx) {
    return StreamBuilder<double>(
      stream: classActy.outProgress,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(width: 0, height: 0);
        } else {
          return Container(
              margin: EdgeInsets.only(right: 6, left: 6, top: 6),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width, maxHeight: 20),
              child: LinearPercentIndicator(
                lineHeight: 20.0,
                percent: snapshot.data,
                center: Text(
                  "${(snapshot.data * 100).round()}%",
                  style: new TextStyle(fontSize: 12.0),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey.shade400,
                progressColor: Colors.blue,
              ));
        }
      },
    );
  }

  Future<bool> dialogLeaveClass() async {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            'Se você sair da atividades, todas as respostas serão perdidas',
            [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Sair',
                  style: TextStyle(color: Color(0xff9B59B6)),
                ),
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Continuar atividade',
                      style: TextStyle(color: Colors.white)))
            ],
            'Deseja sair da atividade?',
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
