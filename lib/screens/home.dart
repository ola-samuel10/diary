import 'package:diary/homepage.dart';
import 'package:diary/input.dart';
import 'package:diary/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                ' My Pal',
                style: GoogleFonts.blackAndWhitePicture(
                  color: AppColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Write about today',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppColor.primary,
                      ))
                ],
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'In literary theory,  is a work of literature, a street sign, an arrangement of buildings on a city block, or styles of clothing. It is a coherent set of signs that transmits some kind of informative message.',
                        style: TextStyle(color: AppColor.white, fontSize: 15),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 158, 190, 159),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: AppColor.white, fontSize: 15),
                                      )),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Discard',
                                      style: TextStyle(
                                          color: AppColor.primary, fontSize: 15),
                                    )),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                
                children: [
                  card(child: const Input(),
                  text: 'My Dreams',
                  icons: Icons.batch_prediction),
                  SizedBox( width: 10, height: 20,),
                   card(child: const HomePage(),
                  text: 'Daily activites',
                  icons: Icons.public),
                   SizedBox( width: 10,),
                  card(child: const HomePage(),
                  text: 'Love matters',
                  icons: Icons.favorite),
                  SizedBox( width: 10,),
                   card(child: const HomePage(),
                  text: 'Family',
                  icons: Icons.apps),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

   Widget card(
    {String? text,
      required Widget child,
      IconData? icons,
      }
  ) {
    return
    Container(
              height: 150,
              width: 150,
               margin: const EdgeInsets.only( bottom: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.txtblack,
                    blurRadius: 2.0,
                    // spreadRadius: 0,
                    offset: const Offset(
                      0,
                      5,
                    ),
                  ),
                ],
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  SizedBox( height: 10,),
                    Icon(icons, color: AppColor.primary, size: 30,),
                    Text('$text',  style: TextStyle(
                                        color: AppColor.primary, fontSize: 15, fontWeight: FontWeight.w700),),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
                        color: AppColor.primary,
                      ),
                      child: IconButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => child));
                      }, icon: Icon(Icons.add, color: AppColor.white,)),
                    )
                  ],
                 )                       
                ],
              ),
            );
  }
}