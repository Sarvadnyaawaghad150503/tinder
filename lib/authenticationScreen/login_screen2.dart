import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
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
                  height: 220,
                ),
                Image.asset(
                  "images/tinder_logo.png",
                  width: 150,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "By clicking Login",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Text(
                  " you agree with our terms and conditions.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Text(
                  " Learn how we process your data in Privacy Policy and cookies policy",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      _buildButton(
                        "Continue with Google",
                        "images/google.jpeg",
                        () {
                          // Implement your Google login logic here
                        },
                      ),
                      const SizedBox(height: 40),
                      _buildButton(
                        "Continue with Facebook",
                        "images/fb.png",
                        () {
                          // Implement your Facebook login logic here
                        },
                      ),
                      const SizedBox(height: 40),
                      _buildButton(
                        "Login with Phone Number",
                        "images/msg.png",
                        () {
                          // Implement your phone number login logic here
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Trouble Loggin in ?'),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, String logoPath, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Colors.black,
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoPath,
            height: 24, // Adjust the height of the logo as needed
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
