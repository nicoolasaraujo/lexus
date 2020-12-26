import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/components/home_button.dart';
import 'package:lexus/app/pages/home/home_bloc.dart';
import 'package:lexus/app/pages/home/home_module.dart';
import 'package:lexus/app/pages/student/student_home_module.dart';

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
                              "Olá, Jonas!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
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
                                  style: TextStyle(
                                      color: Color(0xff9B59B6), fontSize: 20)),
                            ),
                            HomeButton(
                                Icons.group,
                                Text('Turmas',
                                    style: TextStyle(color: Colors.white)),
                                this.navigateClassess),
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
                                  style: TextStyle(
                                      color: Color(0xff9B59B6), fontSize: 20)),
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
        context, MaterialPageRoute(builder: (context) => Students()));
  }
}
