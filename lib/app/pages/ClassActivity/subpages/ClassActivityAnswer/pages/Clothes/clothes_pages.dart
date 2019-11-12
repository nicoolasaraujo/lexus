import 'package:flutter/material.dart';
import 'package:lexus/app/components/clasess_container.dart';
import 'package:lexus/app/components/option_card.dart';
import 'package:lexus/app/model/Clothes.dart';
import '../../class_module.dart';
import 'clothes_bloc.dart';

class ClothesPage extends StatefulWidget {
  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  var clothesBloc = ClassAnswerModule.to.getBloc<ClothesBloc>();

  @override
  void initState() {
    super.initState();
    clothesBloc.loadClothes();
  }

  @override
  Widget build(BuildContext context) {
    return ClassesContainer(
      confirm: this.navigateNext,
      title: "Selecione a roupa mais adequada",
      child: this._buildCardListOptions(context),
    );
  }

  Widget _buildCardListOptions(BuildContext context) {
    return StreamBuilder<List<Clothes>>(
      stream: clothesBloc.outClothesList,
      builder: (context, snapshot) {
        if (snapshot != null && snapshot.hasData) {
          var list = snapshot.data;
          return GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: list.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              var itemClothes = list[index];
              return StreamBuilder<Clothes>(
                stream: clothesBloc.outSelectedClothes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                        heightFactor: 1,
                        child: OptionCard(
                            description: itemClothes.description,
                            selected: itemClothes.id == snapshot.data.id,
                            imagePath: itemClothes.imgPath,
                            index: index,
                            handleTap: clothesBloc.changeSelectedClothes));
                  } else
                    return Center(
                        heightFactor: 1,
                        child: Container(
                            margin: EdgeInsets.all(2),
                            child: OptionCard(
                                description: itemClothes.description,
                                selected: false,
                                imagePath: itemClothes.imgPath,
                                index: index,
                                handleTap: clothesBloc.changeSelectedClothes)));
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

  void navigateNext() {
    this.clothesBloc.forwardQuestion();
    Navigator.pushReplacementNamed(context, '/class/situation');
  }
}
