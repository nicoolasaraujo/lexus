import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceClothesBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/Situation.dart';

class Place {
  Place();

  @PrimaryKey()
  String id;
  String description;
  String imgPath;

  @ManyToMany(PlaceClothesBean, ClothesBean)
  List<Clothes> placesClothes;

  @HasMany(SituationBean)
  List<Situation> situations;

  @HasMany(ClassActivityAnswerBean)
  List<ClassActivityAnswer> classanswers;

  Place.make(String id, String description, String imgPath) {
    this.id = id;
    this.description = description;
    this.imgPath = imgPath;
  }
}
