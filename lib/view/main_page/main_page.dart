import 'package:flutter/material.dart';
import 'package:student_db_provider/view/add_student/add_student.dart';
import 'package:student_db_provider/view/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:student_db_provider/view/home/home_page.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});

  final _pages =[
   const StudentHome(),
    AddStudentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int index, _) {
        return _pages[index];
      },),
      bottomNavigationBar: const BottomNav(),
    );
  }
}