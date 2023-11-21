import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_db_provider/constants/constants.dart';
import 'package:student_db_provider/database/db_functions.dart';
import 'package:student_db_provider/view/add_student/add_student.dart';
import 'package:student_db_provider/view/common_widgets/appbar_widget/appbar_widget.dart';
import 'package:student_db_provider/view/details/student_details.dart';

ValueNotifier<bool> isSearching = ValueNotifier(false);

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    // getAllStudents();
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBArWidget(
        title: 'HOME SCREEN',
        iconData: InkWell(
            onTap: () {
              isSearching.value = !isSearching.value;
            },
            child: const Icon(Icons.search)),
      )),
      body: Column(
    children: [
      ValueListenableBuilder(
          valueListenable: isSearching,
          builder: (context, value, _) {
            return AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: isSearching.value ? 70 : 0,
                curve: Curves.easeInCirc,
                child: ValueListenableBuilder(
                    valueListenable: isSearching,
                    builder: (context, value, _) {
                      return value
                          ? const CupertinoSearchTextField()
                          : const SizedBox();
                    }));
          }),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentDetailsPage(),
                    ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: baseColor,
                  ),
                  child: Row(
                    children: [
                      kWidth20,
                      // CircleAvatar(radius: 45,),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Title',
                            style: costomTextStyle(),
                          ),
                          Text(
                            'Subtitle',
                            style: costomTextStyle(),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
      ),
      // floatingActionButton: FloatingActionButton(
      // backgroundColor: baseColor,
      // onPressed: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => AddStudentPage(),
      //       ));
      // },
      // child: const Icon(Icons.add)),
    );
  }
}
