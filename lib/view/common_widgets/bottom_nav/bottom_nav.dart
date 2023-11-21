import 'package:flutter/material.dart';
import 'package:student_db_provider/constants/constants.dart';

ValueNotifier<int>indexChangeNotifier = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int newIndex, _) {
     return BottomNavigationBar(  
      backgroundColor: baseColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        indexChangeNotifier.value = index;
        
        
      },
      currentIndex: newIndex,
      items:const [
      BottomNavigationBarItem(icon: Icon(Icons.home_work_outlined),label: 'Home'),
      // BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add'),
    ]); 
    },);
  }
}