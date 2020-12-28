import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Student.dart';

import 'register/register/student_register_page.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key key, VoidCallback onItemC}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  var listClassroom = [
    Classroom()
      ..description = "6º ano - Tarde"
      ..extraInfo = "Atendimento para ampliação de acervo lexical 6º ano"
      ..id = "1",
    Classroom()
      ..description = "9º ano - Manhã"
      ..extraInfo = "Atendimento voltado para ensino de sinônimos 9º ano"
      ..id = "2",
  ];

  var students = [
    Student.makeClassRoom('1', 'Jonas de Souza', DateTime.now(), 0, '1', 'xxxx')
      ..extraInfo =
          "Aluno CID F: 70. Auxilio em atividades relacionadas a sinônimos"
      ..setClassroom(Classroom()
        ..description = "6º ano - Tarde"
        ..extraInfo = "Atendimento para ampliação de acervo lexical 6º ano"
        ..id = "1"),
    Student.makeClassRoom(
        '2', 'Claudia Ferreira', DateTime.now(), 0, '1', 'xxxx')
      ..extraInfo = "Aluna CID F: 70. Auxilio em atividades situação"
      ..setClassroom(Classroom()
        ..description = "9º ano - Manhã"
        ..extraInfo = "Atendimento voltado para ensino de sinônimos 9º ano"
        ..id = "2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Meus Alunos"),
            floating: true,
            expandedHeight: 0,
          ),
          SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, index) => this._buildListItem(index),
            // Builds 1000 ListTiles
            childCount: this.students.length,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StudentRegisterPage(
                      crudAction: EnumCrudAction.CREATE,
                    ))),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Text(this.students[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          subtitle: Text(this.students[index].extraInfo),
          isThreeLine: true,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentRegisterPage(
                        crudAction: EnumCrudAction.EDIT,
                      ))),
        ),
      ),
    );
  }
}
