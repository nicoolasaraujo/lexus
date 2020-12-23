import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _advanceButtonSound = false;
  bool _textToSpeechSound = false;
  bool _useDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Olá, Jonas!",
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
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Texto",
                    style: TextStyle(fontSize: 20),
                  )),
              Card(
                elevation: 1,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.text_fields),
                  title: Text("Tamanho do texto"),
                  subtitle: Text(
                      "Alterar tamanho dos textos apresentados no aplicativo"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sons",
                    style: TextStyle(fontSize: 20),
                  )),
              Card(
                elevation: 1,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          this.changeUseTextToSpeech(!this._textToSpeechSound),
                      child: SwitchListTile(
                        onChanged: this.changeUseTextToSpeech,
                        value: _textToSpeechSound,
                        contentPadding: EdgeInsets.all(10),
                        secondary: Icon(Icons.record_voice_over),
                        title: Text("Ativar leitura de texto"),
                        subtitle: Text(
                            "Utilizar leitura de texto ao selecionar as opções nas atividades"),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () =>
                          this.changeUseAdvanceSound(!this._advanceButtonSound),
                      child: SwitchListTile(
                          value: _advanceButtonSound,
                          onChanged: this.changeUseAdvanceSound,
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Ativar som botão avançar"),
                          subtitle: Text(
                              "Utilizar som ao selecionar o botão avançar durante as atividades"),
                          secondary: FaIcon(FontAwesomeIcons.volumeDown)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tema",
                    style: TextStyle(fontSize: 20),
                  )),
              Card(
                elevation: 1,
                child: GestureDetector(
                  onTap: () => this.changeTheme(!this._useDarkTheme),
                  child: SwitchListTile(
                    value: this._useDarkTheme,
                    onChanged: this.changeTheme,
                    contentPadding: EdgeInsets.all(10),
                    secondary: FaIcon(FontAwesomeIcons.solidMoon),
                    title: Text("Utilizar tema escuro"),
                    subtitle: Text("Utilizar a aplicação com tema escuro"),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void changeUseAdvanceSound(bool value) {
    setState(() {
      this._advanceButtonSound = value;
    });
  }

  changeUseTextToSpeech(bool value) {
    setState(() {
      this._textToSpeechSound = value;
    });
  }

  void changeTheme(bool value) {
    setState(() {
      this._useDarkTheme = value;
    });
  }
}
