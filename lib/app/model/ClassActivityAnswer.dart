import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/SituationAnswers.dart';

import 'place.dart';

class ClassActivityAnswer {

  ClassActivityAnswer();
  ClassActivityAnswer.make(this.id, this.initialTime, {this.studentId = '1', this.classAcitviyId}){
    this.situationAnswers = [];
  }

  @PrimaryKey()
  String id;
  DateTime initialTime;
  DateTime endTime;

  @BelongsTo(ClassActivityBean)
  String classAcitviyId;

  @BelongsTo(ClothesBean)
  String clothesId;

  @BelongsTo(PlaceBean)
  String placeId;

  @BelongsTo(StudentBean)
  String studentId;

  @IgnoreColumn()
  Place _place;

  @IgnoreColumn()
  Clothes _clothes;

  @IgnoreColumn()
  Place get place => this._place;

  void setPlace(Place place) {
    this._place = place;
    this.placeId = this._place.id;
  }

  @IgnoreColumn()
  Clothes get clothes => this._clothes;

  void setClothes(Clothes clothes) {
    this._clothes = clothes;
    this.clothesId = clothes.id;
  }

  @HasMany(SituationAnswersBean)
  List<SituationAnswer> situationAnswers;
}
