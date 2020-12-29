import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lexus/app/components/common_dialog.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_module.dart';
import 'package:lexus/app/pages/student/student_home_module.dart';

class SelectStudent extends StatefulWidget {
  const SelectStudent({Key key, VoidCallback onItemC}) : super(key: key);

  @override
  _SelectStudentState createState() => _SelectStudentState();
}

class _SelectStudentState extends State<SelectStudent> {
  var _currencies = [
    "Turma 1",
    "Turma 2",
    "Turma 3",
  ];

  String _currentSelectedValue;

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
    Student.makeClassRoom('1', 'Jonas de Souza', DateTime.now(), 0, '1',
        "Aluno CID F: 70. Auxilio em atividades relacionadas a sinônimos")
      ..setClassroom(Classroom()
        ..description = "6º ano - Tarde"
        ..extraInfo = "Atendimento para ampliação de acervo lexical 6º ano"
        ..id = "1"),
    Student.makeClassRoom('2', 'Claudia Ferreira', DateTime.now(), 0, '1',
        '"Aluna CID F: 70. Auxilio em atividades situação"')
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
            title: Text("Selecione um aluno para avançar"),
            floating: false,
            expandedHeight: 0,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => this._buildListItem(index),
            childCount: this.students.length,
          ))
        ],
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
            onTap: () async {
              var response = await dialogRequestPassword();
              if (response == null) {
                response = false;
              }
              if (response) Navigator.of(context).pop();
            }),
      ),
    );
  }

  Future<bool> dialogRequestPassword() async {
    // call routine to validate password
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Digite a senha para iniciar o atendimento:"),
            content: InputLogin(),
            actions: [
              // Expanded(
              // child:
              RaisedButton.icon(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text(
                  "Cancelar",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.0)),
              ),
              // ),
              // Expanded(
              //   child:
              FlatButton.icon(
                  padding: EdgeInsets.all(12),
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  label: Text('Avançar', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Color(0xff9B59B6),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentHomeModule()))),
              // ),
            ],
          );
        });
  }
}

class InputLogin extends StatefulWidget {
  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  var _isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () => this.setState(() {
                  this._isObscureText = !this._isObscureText;
                }),
            icon: FaIcon(!this._isObscureText
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash)),
        icon: Icon(Icons.vpn_key),
        hintText: 'Senha',
        border: const OutlineInputBorder(),
        labelText: 'Senha',
      ),
      cursorColor: Colors.red,
      obscureText: this._isObscureText,
    ));
  }
}
