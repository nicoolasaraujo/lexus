import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lexus/app/pages/home/home_bloc.dart';
import 'package:lexus/app/pages/home/home_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeBloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    homeBloc.loadGender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffECF0F1),
          title: Text('Aula 1', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)),
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
                      children: <Widget>[
                        // OptionCard(),
                        this._buildCardListOptions(context)
                      ],
                    ),
                  ))

              // child: this._customCard(context))
            ],
          ),
        ));
  }

  Widget _buildCardListOptions(BuildContext context) {
    return StreamBuilder<List<Gender>>(
      stream: homeBloc.outGenderList,
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
                stream: homeBloc.outSelectedGender,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                        heightFactor: 1,
                        child: OptionCard(
                            description: itemGender.description,
                            selected: itemGender.id == snapshot.data.id,
                            imagePath: itemGender.imgPath,
                            index: index,
                            handleTap: homeBloc.changeSelectedGender));
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
                            handleTap: homeBloc.changeSelectedGender)));
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

class OptionCard extends StatelessWidget {
  final index;
  final bool selected;
  final String imagePath;
  final String description;
  final Function handleTap;

  OptionCard(
      {Key key,
      @required this.imagePath,
      @required this.description,
      this.selected = false,
      @required this.handleTap,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: selected
          ? Stack(children: <Widget>[
              this._buildCardOption(),
              Container(
                color: Color.fromRGBO(114, 188, 212, 98),
              )
            ])
          : this._buildCardOption(),
      onTap: _handleTap,
    );
  }

  Card _buildCardOption() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Center(
              widthFactor: 0.4,
              child: Image.asset(imagePath,
                  height: 110, width: 200, fit: BoxFit.scaleDown),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(description, style: TextStyle(color: Colors.white)),
            ),
            decoration: BoxDecoration(color: Color(0xff9B59B6)),
          ),
        ],
      ),
    );
  }

  void _handleTap() {
    handleTap(index);
  }
}
