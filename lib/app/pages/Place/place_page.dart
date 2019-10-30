import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lexus/app/components/option_card.dart';
import 'package:lexus/app/components/successful.dart';
import 'package:lexus/app/pages/Place/place_bloc.dart';
import 'package:lexus/app/pages/home/home_module.dart';


class PlacePage extends StatefulWidget {
  const PlacePage({Key key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  var placeBloc = HomeModule.to.getBloc<PlaceBloc>();

  @override
  void initState() {
    placeBloc.loadPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Color(0xffECF0F1),
    //       title: Text('Aula 2', style: TextStyle(color: Colors.black)),
    //       centerTitle: true,
    //     ),
    //     body: 
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Selecione um local",
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
                      children: <Widget>[
                        this._buildCardListOptions(context)
                      ],
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
                          onPressed: () => 
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => Successful()))
                              ,
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
        );
        // );
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
}
