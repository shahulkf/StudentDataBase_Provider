
import 'package:flutter/cupertino.dart';
import 'package:student_db_provider/database/db_functions.dart';
import 'package:student_db_provider/model/student_modal/students_modal.dart';

class StudentProvider extends ChangeNotifier{

String image = '';
updateImage(image){
  this.image=image;
  notifyListeners();
}

  List<StudentModel> studentList = [];

  
  getAllStudents()async{
    final response = await StudentDatabase().getAllStudents();
    studentList =response;
    notifyListeners();

  }

  Future <void> addStudent(StudentModel student)async{
   await StudentDatabase().addStudent(student);
   getAllStudents();
  }

   deleteStudent(int id)async{
   await StudentDatabase().deleteStudent(id);
   await getAllStudents();
  
  }
  editStudent(StudentModel student)async{
    await StudentDatabase().updateStudent(student);
    getAllStudents();
  }
  searchStudent(String query)async{
    final students=
  await StudentDatabase().searchStudent(query);
  studentList=students;
  notifyListeners();
  
  }



}