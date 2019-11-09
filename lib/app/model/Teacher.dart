import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/classActivity.dart';

class Teacher {
  Teacher();

  Teacher.make(this.id, this.description, this.birthday, this.profilePicture, this.emailAddres);
  
  @PrimaryKey()
  String id;
  String description;
  DateTime birthday;
  String profilePicture;
  String emailAddres;

  @HasMany(ClassroomBean)
  List<Classroom> classes;

  @HasMany(ClassActivityBean)
  List<ClassActivity> classActivities;
}
