import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_2/controller/sign_in_bloc.dart';
import 'package:time_tracker_2/screens/home_screen/home_screen.dart';
import 'package:time_tracker_2/screens/list_screen/list_screen.dart';
import 'package:time_tracker_2/service/auth.dart';

class LandingScreen extends StatelessWidget {
  final SignInBloc bloc;
  const LandingScreen({
    required this.bloc, 
    Key? key
    }) : super(key: key);
  //final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            print(auth.currentUser);
            return HomeScreen.create(context);
          } else {
            return ListScreen(title: "Home", bloc: bloc,);
          }
        } 
        return HomeScreen(bloc: bloc,);
      },
    );
  }
}
