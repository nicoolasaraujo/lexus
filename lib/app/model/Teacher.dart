import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/classActivity.dart';

class Teacher {
  Teacher();

  Teacher.make(
    this.id,
    this.description,
    this.username,
    this.password,
  );

  @PrimaryKey()
  String id;
  String description;
  String username;
  String password;

  @HasMany(ClassroomBean)
  List<Classroom> classes;

  @HasMany(ClassActivityBean)
  List<ClassActivity> classActivities;
}
