import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/components/home_button.dart';
import 'package:lexus/app/pages/student/student_home_module.dart';
import 'package:lexus/app/pages/teacher/classrooms/classroom_page.dart';
import 'package:lexus/app/pages/teacher/students/student_page.dart';

import 'home_bloc.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeBloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Olá, Professor!",
                              style: TextStyle(fontSize: 20),
                            )),
                        Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.logout),
                                label: Text("Sair"))),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Cadastros',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            HomeButton(
                                Icons.group,
                                Text('Turmas',
                                    style: TextStyle(color: Colors.white)),
                                this.navigateClassrooms),
                            HomeButton(
                                Icons.group,
                                Text('Alunos',
                                    style: TextStyle(color: Colors.white)),
                                this.navigateStudents)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Atividades',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            HomeButton(
                                Icons.my_library_books,
                                Text('Iniciar Atividades',
                                    style: TextStyle(color: Colors.white)),
                                this.navigateClassess)
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     ,
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }

  void navigateClassess() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentHomeModule()));
  }

  void navigateStudents() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentsPage()));
  }

  void navigateClassrooms() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ClassroomPage()));
  }
}
