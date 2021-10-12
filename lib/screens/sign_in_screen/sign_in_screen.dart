import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_2/screens/sign_in_screen/components.dart';
import 'package:time_tracker_2/service/auth.dart';

class SignInScreen extends StatelessWidget {
  //  final AuthBase auth;

  const SignInScreen({
    // required this.auth, 
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              child: EmailSignInForm(auth:  auth,),
            )),
      ),
    );
  }
}
