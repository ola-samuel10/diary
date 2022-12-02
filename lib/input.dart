import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/homepage.dart';
import 'package:diary/utils/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  static const TextStyle _textStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w800,
    color: Colors.brown,
);
TextEditingController text = TextEditingController();
 final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.primary,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children:  [
      //            ResponsiveNotebookBackground(
      //     options: ResponsiveNotebookBackgroundOptions(
      //       blankLines: 10,
      //       horizontalPadding: 100,
      //       lineWidth: 2.5,
      //       backgroundColor: Colors.black12,
      //       lineColor: AppColor.primary,
      //       lineType: LineType.line,
      //       styleForHeightCalculation: _textStyle,
      //     ),
      // ),
        TextFormField(
          controller: text,
        ),

        TextButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  createUser();
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
          ],
        ),
      ),
    );
  }

   @override
  void initState() {
    // TODO: implement initState
    text = TextEditingController();
   
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    text.dispose();
    
    super.dispose();
  }

   Future createUser() async {
    // startLoading();
    User? user = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('text').doc();
    await docUser.set({
      'name': text.text,
      
    }).then((value) async {
      // stopLoading();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }
}