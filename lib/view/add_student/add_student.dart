// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_db_provider/constants/constants.dart';
import 'package:student_db_provider/utils/utils.dart';
import 'package:student_db_provider/view/common_widgets/appbar_widget/appbar_widget.dart';

    String ?imageView;
class AddStudentPage extends StatelessWidget {
   AddStudentPage({
    super.key,
  });
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final batchController = TextEditingController();
  final phoneNumberController = TextEditingController();
  //  final bool _validate = false;
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBArWidget(
        title: 'ADD STUDENT',
      )),
      body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kHeight50,
            const SizedBox(
              width: double.infinity,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: baseColor,
                  image:imageView==null?null: DecorationImage(image: FileImage(File(imageView!))),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: IconButton(
                  onPressed: ()async {
                    final image = await pickImage();
                    if(image!=null){
                      imageView=image;
                    }
                  },
                  icon: const Icon(
                    Icons.photo_camera_back_outlined,
                    size: 80,
                    color: Colors.white60,
                  )),
            ),
            kHeight50,
            TextFormField(
             validator: (value) {
                if(value!.isEmpty){
                  return 'Field is Required';
                }else{
                  return null;
                }
              },
              
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
               
                  label: Text('Name')),
                  
            ),
            kHeight20,
            TextFormField(
               validator: (value) {
                if(value!.isEmpty){
                  return 'Field is Required';
                }else{
                  return null;
                }
              },
              controller: ageController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Age',
                  label: Text('Age')),
              keyboardType: TextInputType.number,
            ),
            kHeight20,
            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Field is Required';
                }else{
                  return null;
                }
              },
              controller: batchController,
              decoration:  const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Batch',
                  label: Text('Batch')),
            ),
            kHeight20,
            TextFormField(
               validator: (value) {
                if(value!.isEmpty){
                  return 'Field is Required';
                }else{
                  return null;
                }
              },
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                  label: Text('Phone Number')),
            ),
            kHeight50,
            ElevatedButton(
              onPressed: () {
              checkLogin();
              },
              child:Text(
                'Add Details',
                style: costomTextStyle(),
              ),
              style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(700, 50))),
            )
          ],
        ),
      ),
    ),
      ),
    );
  }
  checkLogin(){
    _formKey.currentState!.validate();
    nameController.clear();
    ageController.clear();
    batchController.clear();
    phoneNumberController.clear();
}

 
}


