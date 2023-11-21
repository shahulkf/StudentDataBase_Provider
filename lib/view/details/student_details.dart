import 'package:flutter/material.dart';
import 'package:student_db_provider/constants/constants.dart';
import 'package:student_db_provider/view/common_widgets/appbar_widget/appbar_widget.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBArWidget(
            title: 'Details',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kHeight50,
          const CircleAvatar(
            radius: 95,
            backgroundColor: baseColor,
          ),
          Container(
            height: 350,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200)),
                color: baseColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('NAME :',style: costomTextStyle()),
                    kHeight20,
                    Text('AGE :',style: costomTextStyle()),
                    kHeight20,
                    Text('BATCH:',style: costomTextStyle()),
                    kHeight20,
                    Text('PHONE NUMBER :',style: costomTextStyle()),
                  ],
                ),
          )
        ],
      ),
    );
  }
}
