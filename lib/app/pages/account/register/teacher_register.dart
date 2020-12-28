import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/pages/teacher/home/home_module.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TeacherRegisterPage extends StatefulWidget {
  final EnumCrudAction crudAction;

  const TeacherRegisterPage({Key key, @required this.crudAction})
      : super(key: key);

  @override
  _TeacherRegisterPageState createState() => _TeacherRegisterPageState();
}

class _TeacherRegisterPageState extends State<TeacherRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool isCreateAction;

  bool _isObscureText = true;

  @override
  void initState() {
    super.initState();
    this.isCreateAction = this.widget.crudAction == EnumCrudAction.CREATE;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${isCreateAction ? "Novo" : "Editar"} Educador"),
          actions: [
            !this.isCreateAction
                ? IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => {},
                  )
                : SizedBox(
                    height: 0,
                    width: 0,
                  )
          ]),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Form(
              key: this._formKey,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    this._buildInputName(),
                    this._formSpaceBtw(),
                    this._buildUsername(),
                    this._formSpaceBtw(),
                    this._buildPasswordField(),
                  ]))),
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
                  label: Text('Criar', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Color(0xff9B59B6),
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop()),
            )
          ],
        ),
      ),
    );
  }

  Widget _formSpaceBtw() {
    return SizedBox(height: 20);
  }

  Widget _buildInputName() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(MdiIcons.accountDetails),
            hintText: 'Nome',
            border: const OutlineInputBorder(),
            labelText: 'Nome do educador'));
  }

  Widget _buildUsername() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Usuário',
            border: const OutlineInputBorder(),
            labelText: 'Nome de usuário para acesar o sistema'));
  }

  Widget _buildPasswordField() {
    return TextFormField(
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
    );
  }
}
