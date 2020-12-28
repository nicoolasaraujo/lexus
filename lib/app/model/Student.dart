import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';

import 'ClassRoom.dart';

class Student {
  Student();

  Student.makeClassRoom(this.id, this.name, this.birthday, this.gender,
      this.classRoomId, this.profilePicture);

  Student.make(this.id, this.name, this.birthday, this.gender);

  @PrimaryKey()
  String id;

  String name;

  DateTime birthday;

  String profilePicture;

  int gender;

  String extraInfo;

  @BelongsTo(ClassroomBean)
  String classRoomId;

  @IgnoreColumn()
  Classroom _classroom;

  @IgnoreColumn()
  Classroom get classroom => this._classroom;

  void setClassroom(Classroom classroom) {
    this._classroom = classroom;
    this.classRoomId = this._classroom.id;
  }

  @HasMany(ClassActivityAnswerBean)
  List<ClassActivityAnswer> classAnswers;
}
