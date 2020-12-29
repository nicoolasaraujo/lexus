import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/model/classActivity.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_module.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/class_module.dart';
import 'package:lexus/app/pages/student/student_home_bloc.dart';
import 'package:lexus/app/pages/student/student_home_module.dart';
import 'package:rxdart/rxdart.dart';

import 'ClassActivity_bloc.dart';

class ClassActivityPage extends StatefulWidget {
  final String title;
  const ClassActivityPage({Key key, this.title = "ClassActivity"})
      : super(key: key);

  @override
  _ClassActivityPageState createState() => _ClassActivityPageState();
}

class _ClassActivityPageState extends State<ClassActivityPage> {
  var classActBloc = ClassActivityModule.to.getBloc<ClassActivityBloc>();
  var bloc = StudentHomeModule.to.getBloc<StudentHomeBloc>();
  @override
  void initState() {
    // this.resetClasses();
    this.classActBloc.loadAllActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text("Lista de Atividades ${bloc.student.name}",
                  style: TextStyle(color: Color(0xff5C5757))),
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text("Pendentes",
                        style: TextStyle(color: Color(0xff5C5757))),
                    icon: Icon(
                      Icons.warning,
                      color: Color(0xff5C5757),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.check, color: Color(0xff5C5757)),
                    child: Text("Concluídas",
                        style: TextStyle(color: Color(0xff5C5757))),
                  ),
                ],
              )),
          body: TabBarView(
            children: [
              this._buildAcitvitiesList(this.classActBloc.ouActivities),
              this._buildAcitvitiesList(
                  this.classActBloc.outActivitiesFinished),
            ],
          )),
    );
  }

  void resetClasses() {
    this.classActBloc.resetClasses();
    this.classActBloc.loadAllActivities();
  }

  Widget _buildAcitvitiesList(Observable<List<ClassActivity>> observable) {
    return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: this._buildClassActivityList(context, observable));
  }

  StreamBuilder<List<ClassActivity>> _buildClassActivityList(
      BuildContext context, Observable<List<ClassActivity>> observable) {
    return StreamBuilder(
      stream: observable,
      builder: (context, AsyncSnapshot<List<ClassActivity>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (!snapshot.hasError) {
          var activities = snapshot.data ?? List();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: activities.length,
            itemBuilder: (_, index) {
              final itemTask = activities[index];
              return _buildListItem(itemTask);
            },
          );
        } else {
          return Center(
            child: Text('Erro:/'),
          );
        }
      },
    );
  }

  Widget _buildListItem(ClassActivity classActivity) {
    return Card(
        elevation: 10,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(children: <Widget>[
              Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${classActivity.description}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Professor: ${classActivity.teacher.description}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                              'Data: ${classActivity.activityDateFormatted()}'))
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      color: Color(0xff00918E),
                      onPressed: () async {
                        this.classActBloc.selectedActivity = classActivity;
                        await Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ClassAnswerModule()));
                        this.classActBloc.loadAllActivities();
                      },
                      child: Text(
                        'Iniciar',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ])));
  }

  _buildFinishedAcitvitiesList() {}
}
