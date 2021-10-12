import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_2/controller/sign_in_bloc.dart';
import 'package:time_tracker_2/screens/landing_screen/landing_screen.dart';
import 'package:time_tracker_2/service/auth.dart';


class ListScreen extends StatelessWidget {
  final SignInBloc bloc;
  final String title;
  //final AuthBase auth;

  //final VoidCallback onSignOut;
  const ListScreen({
    required this.bloc, 
  required this.title, Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
    final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              _signOut(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LandingScreen(bloc: bloc,)));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
