import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/pages/account/register/teacher_register.dart';
import 'package:lexus/app/pages/student/settings/settings_module.dart';
import 'package:lexus/app/pages/teacher/home/home_module.dart';
import '../ClassActivity/ClassActivity_module.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    ClassActivityModule(),
    SettingsModule()
  ];

  var _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              const Color(0xffFF7388)
            ], // red to yellow
          ),
        ),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this._buildInputContainer(),
              this._divider(),
              this._buildSignUp()
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildInputContainer() {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      alignment: Alignment.center,
      child: Form(
        key: this._formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Usuário educador',
                  border: const OutlineInputBorder(),
                  labelText: 'Usuário educador'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: this.navigateHome,
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.0))),
            )
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ),
          Text(
            'ou',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp() {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(right: 40, left: 40),
        child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: CustomOutlinedButton(this.navigateRegister)));
  }

  void navigateHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeModule()));
  }

  void navigateRegister() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TeacherRegisterPage(
                  crudAction: EnumCrudAction.CREATE,
                )));
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomOutlinedButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.white,
      onPressed: onPressed,
      icon: Icon(
        Icons.add,
        color: Theme.of(context).primaryColor,
      ),
      label: Text(
        "Cadastrar",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0)),
    );
  }
}
