import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lexus/app/components/option_card.dart';
import 'package:lexus/app/components/successful.dart';
import 'package:lexus/app/pages/ClassActivity/class_bloc.dart';
import 'package:lexus/app/pages/Place/place_page.dart';
import 'package:lexus/app/pages/home/home_module.dart';

import 'gender_bloc.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key key}) : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  var genderBloc = HomeModule.to.getBloc<GenderBloc>();
  final classActy = HomeModule.to.getBloc<ClassActivityBloc>();

  @override
  void initState() {
    genderBloc.loadGender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Selecione o sexo",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10), 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[this._buildCardListOptions(context)],
                    ),
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                          onPressed: () => {
                            this._navigateNext()
                           } ,
                          child: (Text(
                            "Confirmar",
                            style: TextStyle(color: Colors.white),
                          )),
                          color: Color(0xff2ed573),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                    ),
                  ),
                ),
              )
            ],
          ),
        // )
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
      await Navigator.push(context,CupertinoPageRoute(builder: (context) => Successful()));
      Navigator.push(context, CupertinoPageRoute(builder: (context)=> PlacePage()));
      classActy.increaseProgress();
  }
}
