import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lexus/app/components/clasess_container.dart';
import 'package:lexus/app/components/option_card.dart';
import 'package:lexus/app/model/place.dart';
import '../../class_bloc.dart';
import '../../class_module.dart';
import 'place_bloc.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  var placeBloc = ClassAnswerModule.to.getBloc<PlaceBloc>();

  @override
  void initState() {
    placeBloc.loadPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClassesContainer(
      title: "Selecione um local",
      confirm: this.navigateNext,
      child: this._buildCardListOptions(context),
      listeningStream: this.placeBloc.outSelectedPlace,
    );
  }

  Widget _buildCardListOptions(BuildContext context) {
    return StreamBuilder<List<Place>>(
      stream: placeBloc.outPlaceList,
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
              return StreamBuilder<Place>(
                stream: placeBloc.outSelectedPlace,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                        heightFactor: 1,
                        child: OptionCard(
                            description: itemGender.description,
                            selected: itemGender.id == snapshot.data.id,
                            imagePath: itemGender.imgPath,
                            index: index,
                            handleTap: placeBloc.changeSelectedPlace));
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
                                handleTap: placeBloc.changeSelectedPlace)));
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

  void navigateNext() async {
    var classBloc = ClassAnswerModule.to.getBloc<ClassAnswerBloc>();
    classBloc.userAnswer.setPlace(this.placeBloc.selectedPlace);
    Navigator.pushReplacementNamed(context, '/class/Clothes');
  }
}
