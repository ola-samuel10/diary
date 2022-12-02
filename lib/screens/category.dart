import 'package:diary/homepage.dart';
import 'package:diary/utils/colours.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.primary,
        title: Text('Category'),
        centerTitle: true,
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
                  card(
                    child: const HomePage(),
                    text: 'Daily activity',
                    tet: 'The Floating Action Button is the most unique type of button widget provided in flutter. It is a widget that floats on the screen over other widgets...',
                  ),
                      const SizedBox(height: 15,),
                  card(
                    child: const HomePage(),
                    text: 'Love Matter',
                    tet: 'The Floating Action Button is the most unique type of button widget provided in flutter. It is a widget that floats on the screen over other widgets...',
                  ),
                  
                      SizedBox(height: 20,),
                  card(
                    child: const HomePage(),
                    text: 'My Dreams',
                    tet: 'The Floating Action Button is the most unique type of button widget provided in flutter. It is a widget that floats on the screen over other widgets...',
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget card ( { String? text, required Widget child, tet}) {
    return Column(
      children: [
        Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                 children: [
                  Expanded(child: Text('$text',style: TextStyle(
                    color: AppColor.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),)),

                  Expanded(
                    child: Column(
                      children: [
                        Text('$tet', style: TextStyle(
                      color: AppColor.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400), ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => child));
                                      }, child: Text('Open',
                                      style: TextStyle(
                      color: AppColor.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                 ],
                )
              ),
            ),
      ],
    );
  }
}