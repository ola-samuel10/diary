import 'package:diary/homepage.dart';
import 'package:diary/login.dart';
import 'package:diary/registration.dart';
import 'package:diary/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Text(' My Pal', style: GoogleFonts.blackAndWhitePicture(color: AppColor.black, fontWeight: FontWeight.w700, fontSize: 70, ),),
                 SizedBox(height: 50,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Registration(),
                    ),
                  );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.primary,
                    ),
                    child: Center(child: Text('Get Started', style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w400, fontSize: 20, ),)),
                  ),
                ),
                      SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Loginpage(),
                    ),
                  );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.primary,
                    ),
                    child: Center(child: Text('Login', style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w400, fontSize: 20, ),)),
                  ),
                ),
                
          ],
        ),
      ),
    );
  }
}