import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/pages/teacher/classrooms/register/classroom_register_page.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({Key key}) : super(key: key);

  @override
  _ClasrRoomPageState createState() => _ClasrRoomPageState();
}

class _ClasrRoomPageState extends State<ClassroomPage> {
  var listClassroom = [
    Classroom()
      ..description = "6º ano - Tarde"
      ..extraInfo = "Atendimento para ampliação de acervo lexical 6º ano",
    Classroom()
      ..description = "9º ano - Manhã"
      ..extraInfo = "Atendimento voltado para ensino de sinônimos 9º ano"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 8,
            title: Text(
              "Minhas Turmas",
            ),
            floating: true,
            expandedHeight: 0,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => this._buildListItem(index),
            // Builds 1000 ListTiles
            childCount: this.listClassroom.length,
          ))
        ],
      ),
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

  Widget _buildListItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Text(this.listClassroom[index].description,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          subtitle: Text(this.listClassroom[index].extraInfo),
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
}
