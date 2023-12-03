import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_db_provider/constants/constants.dart';
import 'package:student_db_provider/controller/student_controller/student_controller.dart';
import 'package:student_db_provider/view/add_student/add_student.dart';
import 'package:student_db_provider/view/common_widgets/appbar_widget/appbar_widget.dart';
import 'package:student_db_provider/view/details/student_details.dart';

ValueNotifier<bool> isSearching = ValueNotifier(false);

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    final studentprovider =
        Provider.of<StudentProvider>(context, listen: false);
    studentprovider.getAllStudents();

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
    
      body: RefreshIndicator(
        onRefresh: () async {
          studentprovider.getAllStudents();
        },
        child: Column(
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
                                ? CupertinoSearchTextField(
                                  onChanged: (value) {
                                    studentprovider.searchStudent(value); 
                                  },
                                )
                                : const SizedBox();
                          }));
                }),
            Expanded(
              child: Consumer<StudentProvider>(builder: (context, value, _) {
                if (value.studentList.isEmpty) {
                  return const Center(
                    child: Text(
                      'Oops its Empty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: baseColor),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.studentList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentDetailsPage(
                                student: value.studentList[index],
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
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
                                    image: DecorationImage(
                                        image: FileImage(File(
                                            value.studentList[index].image)),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.studentList[index].name,
                                    style: costomTextStyle(),
                                  ),
                                  Row(
                                    
                                    children: [
                                      Text(
                                        value.studentList[index].batch,
                                        style: costomTextStyle(),
                                      ),
                                      SizedBox(width: 20,),
                                       Container(width: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                      children: [
                                                                     
                                                                        IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddStudentPage(
                                                  student: studentprovider
                                                      .studentList[index],
                                                ),
                                              ));
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        )),
                                                                        IconButton(
                                        onPressed: () {
                                          deleteStudentData(
                                              context,
                                              studentprovider
                                                  .studentList[index].id!);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                                                      ],
                                                                    ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                             
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> deleteStudentData(BuildContext context, int id) {
    final studentprovider =
        Provider.of<StudentProvider>(context, listen: false);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete !'),
        content: const Text('Are You Sure Want To Delete'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No')),
          TextButton(
              onPressed: () async {
                studentprovider
                    .deleteStudent(id)
                    .then((value) => Navigator.pop(context));
              },
              child: const Text('Yes')),
        ],
      ),
    );
  }
  
}




