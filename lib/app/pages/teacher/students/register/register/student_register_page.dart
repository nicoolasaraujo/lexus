import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lexus/app/model/Enumerators.dart';

class StudentRegisterPage extends StatefulWidget {
  final EnumCrudAction crudAction;

  const StudentRegisterPage({Key key, @required this.crudAction})
      : super(key: key);

  @override
  _StudentRegisterStatePage createState() => _StudentRegisterStatePage();
}

class _StudentRegisterStatePage extends State<StudentRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  List<bool> isSelected = [false, true];
  final format = DateFormat("dd-MM-yyyy");
  bool isCreateAction = true;
  EnumGender _gender = EnumGender.MALE;

  var dropdownValue;
  var _currencies = [
    "Turma 1",
    "Turma 2",
    "Turma 3",
  ];

  String _currentSelectedValue;

  var _inputNameController;

  var _inputExtraInfoController;

  var _inputBirthdayController;

  @override
  void initState() {
    super.initState();
    this.isCreateAction = this.widget.crudAction == EnumCrudAction.CREATE;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${isCreateAction ? "Novo" : "Editar"} Aluno"),
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
                Card(
                  elevation: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          this._buildInputName(),
                          this._formSpaceBtw(),
                          this._buildExtraInfo(),
                          this._formSpaceBtw(),
                          this._buildBirthday(),
                          this._formSpaceBtw(),
                          this._buildClassroomDropDown(),
                          this._formSpaceBtw(),
                          this._buildGenderRadio(),
                        ],
                      ),
                    ),
                  ),
                ),
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
        controller: this._inputNameController,
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Nome do aluno',
            border: const OutlineInputBorder(),
            labelText: 'Nome do aluno'));
  }

  Widget _buildExtraInfo() {
    return TextFormField(
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
    );
  }

  Widget _buildBirthday() {
    return DateTimeField(
      controller: this._inputBirthdayController,
      format: format,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        hintText: 'Data de nascimento',
        border: const OutlineInputBorder(),
        labelText: 'Data de nascimento',
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }

  _buildClassroomDropDown() {
    return Row(
      children: [
        Expanded(
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                    icon: Icon(Icons.group),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    hintText: 'Selecione uma turma',
                    labelText: 'Selecione uma turma',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                isEmpty: _currentSelectedValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentSelectedValue,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _currentSelectedValue = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGenderRadio() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Gênero",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: RadioListTile<EnumGender>(
                  title: Text('Masculino'),
                  value: EnumGender.MALE,
                  groupValue: this._gender,
                  onChanged: (EnumGender value) {
                    setState(() {
                      this._gender = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<EnumGender>(
                  title: Text('Feminino'),
                  value: EnumGender.FEMALE,
                  groupValue: this._gender,
                  onChanged: (EnumGender value) {
                    setState(() {
                      this._gender = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
