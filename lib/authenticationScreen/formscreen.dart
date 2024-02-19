import 'package:flutter/material.dart';

void main() => runApp(const FormScreen());

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);
  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: Text(
            'Tinder',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: MyStatefulWidget(),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          width: double.infinity,
          alignment: FractionalOffset(0, 0),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextButton(
                onPressed: (() {}),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                      height: 40,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Sign in',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            //forgot password screen
          },
          child: const Text(
            'Forgot Password',
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // primary: Colors.blue,
                ),
            child: const Text('Login'),
            onPressed: () {
              print(emailController.text);
              print(passwordController.text);
            },
          ),
        ),
        Row(
          children: <Widget>[
            const Text('Does not have an account?'),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // primary: Colors.blue,
                ),
            child: const Text('Sign Up'),
            onPressed: () {
              print(emailController.text);
              print(passwordController.text);
            },
          ),
        ),
      ],
    );
  }
}
