import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/pages/teacher/home/home_module.dart';

import 'classroom_register_bloc.dart';

class ClassroomRegister extends StatefulWidget {
  final EnumCrudAction crudAction;

  const ClassroomRegister({Key key, @required this.crudAction})
      : super(key: key);

  @override
  _ClassroomRegisterState createState() => _ClassroomRegisterState();
}

class _ClassroomRegisterState extends State<ClassroomRegister> {
  final blocRegister = HomeModule.to.getBloc<ClassroomRegisterBloc>();
  bool isCreateAction = true;

  var _inputDescriptionController = TextEditingController();

  var _inputExtraInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.isCreateAction = this.widget.crudAction == EnumCrudAction.CREATE;
    if (isCreateAction) {
      this._inputDescriptionController.text = this.blocRegister.test;
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.isCreateAction ? "Nova" : "Editar"} Turma"),
        actions: [
          this.isCreateAction
              ? SizedBox(
                  width: 0,
                  height: 0,
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => {},
                )
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: this._formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: this._inputDescriptionController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Nome da turma',
                      border: const OutlineInputBorder(),
                      labelText: 'Nome da turma'),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: TextFormField(
                    controller: this._inputExtraInfoController,
                    minLines: 4,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      hintText: 'Observações',
                      border: const OutlineInputBorder(),
                      labelText: 'Observações',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: RaisedButton.icon(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                onPressed: () => {},
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
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Expanded(
              child: FlatButton.icon(
                  padding: EdgeInsets.all(12),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: Text('Salvar', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Color(0xff9B59B6),
                  onPressed: this._saveClassroom),
            )
          ],
        ),
      ),
    );
  }

  _saveClassroom() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
