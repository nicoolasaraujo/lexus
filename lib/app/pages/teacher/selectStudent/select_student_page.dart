import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lexus/app/app_bloc.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/pages/account/login_bloc.dart';
import 'package:lexus/app/pages/student/student_home_module.dart';
import 'package:lexus/app/pages/teacher/home/home_module.dart';
import 'package:lexus/app/pages/teacher/students/student_bloc.dart';

class SelectStudent extends StatefulWidget {
  const SelectStudent({Key key, VoidCallback onItemC}) : super(key: key);

  @override
  _SelectStudentState createState() => _SelectStudentState();
}

class _SelectStudentState extends State<SelectStudent> {
  final accountBloc = AppModule.to.getBloc<LoginBloc>();
  final appBloc = AppModule.to.getBloc<AppBloc>();
  var _isObscureText = true;
  var passController = TextEditingController();

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
          onTap: () async {
            var response = await dialogRequestPassword(student);
            if (response == null) {
              response = false;
            }
            if (response) Navigator.of(context).pop();
          },
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

  Future<bool> dialogRequestPassword(Student student) async {
    // call routine to validate password
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Digite a senha para iniciar o atendimento:"),
            content: this._inputLogin(this.passController),
            actions: [
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
                  onPressed: () => this.validateLogin(student)),
            ],
          );
        });
  }

  validateLogin(Student student) async {
    bool loginCorrect = await this
        .accountBloc
        .validateLogin(this.appBloc.teacher.username, passController.text);
    if (loginCorrect) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentHomeModule(student)));
    }
  }

  Widget _inputLogin(TextEditingController passController) {
    return Container(
        child: TextFormField(
      controller: passController,
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
