import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_2/controller/sign_in_bloc.dart';
import 'package:time_tracker_2/screens/landing_screen/landing_screen.dart';
import 'package:time_tracker_2/service/auth.dart';

//this app, I learn from udemy (Andrea course). now, I solo to make it.
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SignInBloc bloc = SignInBloc(auth: Auth());
  @override
  Widget build(BuildContext context) {
    
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: "Time Tracker",
        theme: ThemeData(
          primaryColor: Colors.indigo,
          backgroundColor: Colors.pinkAccent.shade100,
          scaffoldBackgroundColor: Colors.pinkAccent.shade100,
        ),
        home: LandingScreen(
          bloc: bloc,
          //auth: Auth(),
        ),
      ),
    );
  }
}