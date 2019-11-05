import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/PlaceClothesBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/place.dart';

class Clothes {
  Clothes();
  @PrimaryKey()
  String id;

  String imgPath;

  String description;

  int gender;

  @ManyToMany(PlaceClothesBean, PlaceBean )
  List<Place> places;

  @HasMany(ClassActivityAnswerBean)
  List<ClassActivityAnswer> classanswers;
  
  Clothes.make(this.id, this.description, this.imgPath);
}
