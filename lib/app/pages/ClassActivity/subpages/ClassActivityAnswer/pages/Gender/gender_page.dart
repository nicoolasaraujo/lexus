import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lexus/app/components/clasess_container.dart';
import 'package:lexus/app/components/option_card.dart';
import '../../class_bloc.dart';
import '../../class_module.dart';
import 'gender_bloc.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key key}) : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  var genderBloc = ClassAnswerModule.to.getBloc<GenderBloc>();
  final classActy = ClassAnswerModule.to.getBloc<ClassAnswerBloc>();

  @override
  void initState() {
    genderBloc.loadGender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return ClassesContainer(
          confirm: this._navigateNext,
          title: "Selecione o sexo",
          child: this._buildCardListOptions(context),
        );
  }

  Widget _buildCardListOptions(BuildContext context) {
    return StreamBuilder<List<Gender>>(
      stream: genderBloc.outGenderList,
      builder: (context, snapshot) {
        if (snapshot != null && snapshot.hasData) {
          var list = snapshot.data;
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: list.length,
            itemBuilder: (_, index) {
              var itemGender = list[index];
              return StreamBuilder<Gender>(
                stream: genderBloc.outSelectedGender,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                        heightFactor: 1,
                        child: OptionCard(
                            description: itemGender.description,
                            selected: itemGender.id == snapshot.data.id,
                            imagePath: itemGender.imgPath,
                            index: index,
                            handleTap: genderBloc.changeSelectedGender));
                  } else
                    return Center(
                        heightFactor: 1,
                        child: Container(
                            margin: EdgeInsets.all(2),
                            child: OptionCard(
                                description: itemGender.description,
                                selected: false,
                                imagePath: itemGender.imgPath,
                                index: index,
                                handleTap: genderBloc.changeSelectedGender)));
                },
              );
            },
          );
        } else {
          return Center(child: Text("Nenhum registro encontrado!"));
        }
      },
    );
  }

  void _navigateNext() async{
      Navigator.pushReplacementNamed(context, '/class/place');
  }
}
