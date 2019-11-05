import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';

class Student{
  Student();

  Student.make(this.id, this.name, this.birthday, this.gender);

  @PrimaryKey()
  String id;

  String name;

  DateTime birthday;

  String profilePicture;

  int gender;

  @BelongsTo(ClassroomBean)
  String classRoomId;

  @HasMany(ClassActivityAnswerBean)
  List<ClassActivityAnswer> classAnswers;
}
