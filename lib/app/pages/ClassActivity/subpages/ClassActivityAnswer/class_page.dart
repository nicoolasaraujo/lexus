import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          title: Text("Alguma aula"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(6),
                height: 25,
                child: this.status(context)),
            Expanded(
              flex: 1,
              child: Navigator(
                onGenerateRoute: (settings) => generateRoute(settings),
                initialRoute: '/class/gender',
              ),
            )
          ],
        ));
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/class/gender':
        return CupertinoPageRoute(builder: (_) => GenderPage());
      case '/class/place':
        return CupertinoPageRoute(builder: (_) => PlacePage());
      case '/class/Clothes':
        return CupertinoPageRoute(builder: (_) => ClothesPage());
      case '/class/situation':
        return CupertinoPageRoute(builder: (_) => SituationPage());
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
      initialData: 0,
      stream: classActy.outProgress,
      builder: (context, snapshot) {
        return Container(
            margin: EdgeInsets.only(right: 6, left: 6),
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: LinearPercentIndicator(
              lineHeight: 25.0,
              percent: snapshot.data,
              center: Text(
                "${(snapshot.data * 100).round()}%",
                style: new TextStyle(fontSize: 12.0),
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: Colors.white,
              progressColor: Colors.blue,
            ));
        // return LiquidLinearProgressIndicator(
        //   value: snapshot.data,
        //   backgroundColor: Colors.white,
        //   valueColor: AlwaysStoppedAnimation(Colors.blue),
        //   borderRadius: 12.0,
        // );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
