import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_2/screens/sign_up_screen/sign_up_screen.dart';
import 'package:time_tracker_2/service/auth.dart';

class EmailSignInForm extends StatelessWidget {
  final AuthBase auth;

  EmailSignInForm({required this.auth});

  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  //const EmailSignInForm({ Key? key }) : super(key: key);
  String email = "";
  String password = "";

  // @override
  // void dispose(){
  //   _emailControler.dispose();
  //   _passwordControler.dispose();
  //   _emailFocusNode.dispose();
  //   _passwordFocusNode.dispose();
  //   super.dispose();
  // }

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
            onEditingComplete: () async {
              email = _emailControler.text;
              password = _passwordControler.text;
              print(email + password);
              try {
                await auth.signInWithEmailAndPassword(email, password);
                Navigator.pop(context);
              } catch (e) {
                print(e.toString());
              }
            },
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
                await auth.signInWithEmailAndPassword(email, password);
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
                  "Log In",
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
