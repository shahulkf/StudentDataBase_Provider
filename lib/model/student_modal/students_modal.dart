
import 'package:hive/hive.dart';part 'students_modal.g.dart';

@HiveType(typeId: 1)
class StudentModel{

  @HiveField(0)
  int ?id;
@HiveField(1)
 String name;

 @HiveField(2)
 String age;

 @HiveField(3)
 String batch;

 @HiveField(5)
 String phoneNumber;

 @HiveField(4)
 String image;


 StudentModel({
  required this.name,
  required this.age,
  required this.batch,
  required this.phoneNumber,
  required this.image,
  this.id
  });

}