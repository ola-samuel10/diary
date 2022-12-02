import 'package:diary/firebase_options.dart';
import 'package:diary/homepage.dart';
import 'package:diary/sign.dart';
import 'package:diary/utils/colours.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       inputDecorationTheme: const InputDecorationTheme(
        
        hoverColor: Color.fromARGB(255, 215, 215, 215),
        filled: true,
                    fillColor: Color(0xFF36846c),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFd7d7d7)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF36846c)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}

