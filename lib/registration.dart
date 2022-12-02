import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/homepage.dart';
import 'package:diary/utils/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController pnum = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _startloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                 const SizedBox(height: 20),
                Text(
                  'Create Account',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name:',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(
                        color: AppColor.txtblack,
                      ),
                      cursorColor: AppColor.txtblack,
                      controller: fname,
                      decoration: const InputDecoration(),
                      validator: (value) {
                        RegExp nameRegExp =
                            RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
                        if (value!.trim().isEmpty) {
                          return 'Name cannot be Empty';
                        } else if (value.trim().length < 9) {
                          return 'Full name is required';
                        } else if (nameRegExp.hasMatch(value.trim())) {
                          return 'invalid input';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Email Address:',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(
                        color: AppColor.txtblack,
                      ),
                      cursorColor: AppColor.txtblack,
                      controller: email,
                      decoration: const InputDecoration(),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Email can not be empty';
                        } else if (value.trim().length < 6) {
                          return 'Enter a valid email';
                        } else if (!value.contains('@')) {
                          return 'check for missing letter @';
                        } else if (!value.contains('.com')) {
                          return 'Email must contain keyword ".com"';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Username:',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(
                        color: AppColor.txtblack,
                      ),
                      cursorColor: AppColor.txtblack,
                      controller: username,
                      decoration: const InputDecoration(),
                      validator: (value) {
                        RegExp nameRegExp =
                            RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
                        if (value!.trim().isEmpty) {
                          return 'Name cannot be Empty';
                        } else if (value.trim().length < 3) {
                          return 'Full name is required';
                        } else if (nameRegExp.hasMatch(value.trim())) {
                          return 'invalid input';
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 15),
                    Text(
                      'Phone Number:',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(
                        color: AppColor.txtblack,
                      ),
                      cursorColor: AppColor.txtblack,
                      controller: pnum,
                      decoration: const InputDecoration(),
                       validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'phone number cant be empty';
                        } else if (value.trim().length != 11) {
                          return 'Phone Number must be 11 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Password:',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(
                        color: AppColor.txtblack,
                      ),
                      cursorColor: AppColor.txtblack,
                      controller: Password,
                      decoration: const InputDecoration(),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Password cant be empty';
                        } else if (value.trim().length < 6) {
                          return 'cant be less than 6';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                _startloading
                    ? const CircularProgressIndicator()
                :Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primary,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        handleRegister(email.text, Password.text);
                      }
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
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Divider(
                        color: AppColor.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('or continue with'),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Divider(
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (() {
                         signInWithGoogle();
                      }),
                      child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppColor.primary),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white,
                          ),
                          child: SizedBox(
                            height: 10,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/imgs/google.png',
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: (() {}),
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColor.primary),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white,
                        ),
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/imgs/face.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Aleady have an account?',
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign in',
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
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    fname = TextEditingController();
    email = TextEditingController();
    username = TextEditingController();
    Password = TextEditingController();
    pnum = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fname.dispose();
    email.dispose();
    username.dispose();
    Password.dispose();
    pnum.dispose();
    super.dispose();
  }

    Future<void> handleRegister(String email, String password) async {
    startLoading();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        stopLoading();
        final docUser =
            FirebaseFirestore.instance.collection('user').doc(value.user!.uid);

        await docUser.set({
          'id': value.user!.uid,
          'name': fname.text,
          'email': email,
          'phone number': pnum.text,
          'password': password,
          'type': 'user',
        }).then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      stopLoading();
      if (e.code == 'weak-password') {
        snackBar('Week password provided for that user.');
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        snackBar('the email provided for that user is taken.');
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
      snackBar(e.toString());
    }
  }
   snackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

   void startLoading() {
    setState(() => _startloading = true);
  }

  void stopLoading() {
    setState(() => _startloading = false);
  }


  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential)

    .then(
      
          (value) async{
            User? user = FirebaseAuth.instance.currentUser;
             final docUser =
            FirebaseFirestore.instance.collection('user').doc(value.user!.uid);

        await docUser.set({
          'id': user!.uid,
          'name': user.displayName,
          'email': user.email,
          // 'phone number': pnum.text,
          
          'type': 'user',
          // 'address': address.text,/
        }).then((value) {
          return null;
        });
            return Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
          },
        );
    
  }
}

