import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/authenticationScreen/main_page.dart';
import 'package:tinder/widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController =
      TextEditingController();
  TextEditingController UsernameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoEditingController = TextEditingController();
  // TextEditingController cityTextEditingController = TextEditingController();
  // TextEditingController countryTextEditingController = TextEditingController();
  // TextEditingController profileHeadingTextEditingController =
  //     TextEditingController();
  //
  // TextEditingController heightTextEditingController = TextEditingController();
  // TextEditingController weightTextEditingController = TextEditingController();
  // TextEditingController bodytypeTextEditingController = TextEditingController();
  // TextEditingController drinkTextEditingController = TextEditingController();
  // TextEditingController smokeTextEditingController = TextEditingController();
  // TextEditingController haveChildrenTextEditingController =
  //     TextEditingController();
  // TextEditingController noOfChildrenTextEditingController =
  //     TextEditingController();
  // TextEditingController professionTextEditingController =
  //     TextEditingController();
  // TextEditingController incomeTextEditingController = TextEditingController();
  // TextEditingController livingSituationTextEditingController =
  //     TextEditingController();
  // TextEditingController willingToRelocateTextEditingController =
  //     TextEditingController();
  // TextEditingController relationshipYouAreLookingForTextEditingController =
  //     TextEditingController();
  // TextEditingController nationalityTextEditingController =
  //     TextEditingController();
  // TextEditingController educationTextEditingController =
  //     TextEditingController();
  // TextEditingController languageSpokenTextEditingController =
  //     TextEditingController();
  // TextEditingController religionTextEditingController = TextEditingController();
  // TextEditingController ethnicityTextEditingController =
  //     TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void createAccount() async {
    String email = emailTextEditingController.text.trim();
    String password = passwordTextEditingController.text.trim();
    String cpassword = confirmpasswordTextEditingController.text.trim();

    if (email == "" || password == "" || cpassword == "") {
      log('Please fill all details');
    } else if (password != cpassword) {
      log('Password do not match');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
          _firestore.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email': email,
          }, SetOptions(merge: true));
        }

        log('Account Created Succesfully');
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'images/tinder_logo.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("to get Started now",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                    )),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: UsernameTextEditingController,
                    labelText: 'Username',
                    iconData: Icons.person_2_outlined,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: emailTextEditingController,
                    labelText: 'Email',
                    iconData: Icons.person_2_outlined,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: ageTextEditingController,
                    labelText: 'Age',
                    iconData: Icons.person_2_outlined,
                    isObscure: false,
                  ),
                ),
                // Add the rest of your CustomTextFieldWidget widgets...

                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: phoneNoEditingController,
                    labelText: 'Phone Number',
                    iconData: Icons.person_2_outlined,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: passwordTextEditingController,
                    labelText: 'Password',
                    iconData: Icons.person_2_outlined,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: confirmpasswordTextEditingController,
                    labelText: 'Confirm Password',
                    iconData: Icons.person_2_outlined,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement your login logic here
                    // For example, you can use Get.to(HomeScreen());
                    log('hiii');
                    // createAccount();
                    createAccount();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      width: 2,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 275,
                    height: 55,
                    alignment: Alignment.center,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 160,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
