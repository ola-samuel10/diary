import 'package:diary/screens/category.dart';
import 'package:diary/screens/home.dart';
import 'package:diary/screens/profile.dart';
import 'package:diary/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    const Category(),
    const Home(),
    const Profile(),
  ];
  @override 
  Widget build(BuildContext context) {
    return Scaffold(

       body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          fixedColor: AppColor.primary,
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() => currentIndex = value),
          selectedIconTheme: IconThemeData(color: AppColor.primary),
          selectedLabelStyle: TextStyle(color: AppColor.primary),
          unselectedLabelStyle: TextStyle(color: AppColor.txtblack),
          unselectedItemColor: AppColor.txtblack,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.support_agent), label: 'Support'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(
                    
                  ),
                ),
              );
            },
            backgroundColor: AppColor.primary,
            child: const Icon(Icons.add),
          ),
    );
  }
  

}
