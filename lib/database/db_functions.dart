import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_db_provider/model/student_modal/students_modal.dart';

class StudentDatabase {
  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    final id = await studentDB.add(value);
    value.id = id;
    await studentDB.putAt(id, value);
  }

  Future<List<StudentModel>> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    return studentDB.values.toList();
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    try {
      await studentDB.delete(id);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateStudent(StudentModel value) async {
    final studentDb = await Hive.openBox<StudentModel>('student_db');
    await studentDb.put(value.id!, value);
  }

  Future<List<StudentModel>> searchStudent(String query) async {
    final studentDb = await Hive.openBox<StudentModel>('student_db');
    var results = query.isEmpty
        ? studentDb.values.toList()
        : studentDb.values
            .where((element) => element.name.toLowerCase().contains(query))
            .toList();
            return results;
  }
}
