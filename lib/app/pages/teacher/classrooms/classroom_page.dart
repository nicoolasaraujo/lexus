import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/pages/teacher/classrooms/register/classroom_register_page.dart';
import 'package:lexus/app/pages/teacher/home/home_module.dart';
import 'classroom_bloc.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({Key key}) : super(key: key);

  @override
  _ClassroomPageState createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final classroomBloc = HomeModule.to.getBloc<ClassroomBloc>();

  @override
  void initState() {
    this.classroomBloc.loadAllClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas Turmas",
        ),
      ),
      body: (Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: this._buildClasses(context))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClassroomRegister(
                      crudAction: EnumCrudAction.CREATE,
                    ))),
        child: Icon(Icons.add),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: CustomScrollView(
  //       slivers: [
  //         SliverAppBar(
  //           elevation: 8,
  //           title: Text(
  //             "Minhas Turmas",
  //           ),
  //           floating: true,
  //           expandedHeight: 0,
  //         ),
  //         StreamBuilder<List<Classroom>>(
  //             stream: this.classroomBloc.outClassrooms,
  //             builder: (context, snapshot) {
  //               if (!snapshot.hasData) {
  //                 return Center(
  //                   child: Center(child: CircularProgressIndicator()),
  //                 );
  //               }
  //               if (!snapshot.hasError) {
  //                 var classrooms = snapshot.data ?? List();
  //                 return SliverList(
  //                     delegate: SliverChildBuilderDelegate(
  //                   (context, index) => this._buildListItem(classrooms[index]),
  //                   childCount: classrooms.length,
  //                 ));
  //               } else {
  //                 return Center();
  //               }
  //             })
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       backgroundColor: Theme.of(context).accentColor,
  //       onPressed: () => Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => ClassroomRegister(
  //                     crudAction: EnumCrudAction.CREATE,
  //                   ))),
  //       child: Icon(Icons.add),
  //     ),
  //   );
  // }

  Widget _buildListItem(Classroom item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Text(item.description,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          subtitle: Text(item.extraInfo),
          isThreeLine: true,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClassroomRegister(
                        crudAction: EnumCrudAction.EDIT,
                      ))),
        ),
      ),
    );
  }

  _buildClasses(BuildContext context) {
    return StreamBuilder(
      stream: this.classroomBloc.outClassrooms,
      builder: (context, AsyncSnapshot<List<Classroom>> snapshot) {
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
}
