import 'package:diary/homepage.dart';
import 'package:diary/utils/colours.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
   TextEditingController fname = TextEditingController();

   bool isopen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(' My Pal', style: GoogleFonts.blackAndWhitePicture(color: AppColor.black, fontWeight: FontWeight.w700, fontSize: 70, ),),
                ],
              ),
              const SizedBox( height: 100),

             Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text('Welcome Back,', style:  TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ],
              ),
                  const SizedBox( height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text('Adeola', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                ],
              ),
                const SizedBox( height: 50),
                 Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text('Enter your login password to proceed', style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                ],
              ),
               const SizedBox( height: 5),
              TextFormField(
                  style: TextStyle(
                    color: AppColor.txtblack,
                  ),
                  cursorColor: AppColor.txtblack,
                  controller: fname,
                   obscureText: isopen,
                  decoration:  InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: TextStyle( color: AppColor.txtblack),
                    suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isopen = !isopen;
                              });
                            },
                            icon: isopen
                                ? Icon(
                                    Icons.visibility,
                                    color: AppColor.txtblack,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: AppColor.txtblack,
                                  )),
                  ),
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'Full name is required';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox( height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Forgot password?',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Reset',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomePage()));
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: AppColor.primary,
                                  fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
            Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary,
                        ),
                        child: TextButton(
                          onPressed: () {
                            // if (formkey.currentState!.validate()) {
                            //   handleRegister(email.text, pass.text);
                            // }
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                       Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Dont have an account?',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15, letterSpacing: 1),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'SIgn in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomePage()));
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: AppColor.primary,
                                  fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}