import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/pages/student/student_home_bloc.dart';
import 'package:lexus/app/pages/teacher/home/home_module.dart';
import 'package:lexus/app/pages/teacher/students/student_bloc.dart';

import 'register/register/student_register_page.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key key, VoidCallback onItemC}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final studentBloc = HomeModule.to.getBloc<StudentBloc>();
  @override
  void initState() {
    this.studentBloc.loadAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus Alunos",
        ),
      ),
      body: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: this._buildClasses(context)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => this.navigateRegisterPage(EnumCrudAction.CREATE),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListItem(Student student) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Text(student.name,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          subtitle: Text(student.extraInfo),
          isThreeLine: true,
          onTap: () => this.navigateRegisterPage(EnumCrudAction.EDIT),
        ),
      ),
    );
  }

  _buildClasses(BuildContext context) {
    return StreamBuilder(
      stream: this.studentBloc.outStudents,
      builder: (context, AsyncSnapshot<List<Student>> snapshot) {
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

  navigateRegisterPage(EnumCrudAction crudAction) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentRegisterPage(
                  crudAction: crudAction,
                )));
    this.studentBloc.loadAllStudents();
  }
}
