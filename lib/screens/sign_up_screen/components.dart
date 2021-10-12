import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker_2/screens/sign_in_screen/sign_in_screen.dart';
import 'package:time_tracker_2/service/auth.dart';

class EmailSignUpForm extends StatelessWidget {
  final AuthBase auth;

  EmailSignUpForm({required this.auth});

  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  //const EmailSignInForm({ Key? key }) : super(key: key);
  String email = "";
  String password = "";

  void _submit() async {
    try {
      await auth.signInWithEmailAndPassword(email, password);
      // Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 42),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _emailControler,
            focusNode: _emailFocusNode,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter email here.",
            ),
          ),
          TextField(
            controller: _passwordControler,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter password here.",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () async {
              email = _emailControler.text;
              password = _passwordControler.text;
              print(email + password);
              try {
                await auth.createUserWithEmailAndPassword(email, password);
                Navigator.pop(context);
              } catch (e) {
                print(e.toString());
              }
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
