import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_db_provider/controller/student_controller/student_controller.dart';
import 'package:student_db_provider/model/student_modal/students_modal.dart';
import 'package:student_db_provider/view/main_page/main_page.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.copyWith(bodyText1: TextStyle(color: Colors.white),),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home:  MainPage ()
      ),
    );
  }
}


