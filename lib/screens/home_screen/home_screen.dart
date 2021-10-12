import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_2/controller/sign_in_bloc.dart';
import 'package:time_tracker_2/screens/home_screen/components.dart';
import 'package:time_tracker_2/screens/list_screen/list_screen.dart';
import 'package:time_tracker_2/screens/sign_in_screen/sign_in_screen.dart';
import 'package:time_tracker_2/screens/sign_up_screen/sign_up_screen.dart';
import 'package:time_tracker_2/service/auth.dart';

class HomeScreen extends StatelessWidget {
  final SignInBloc bloc;
  const HomeScreen({Key? key, required this.bloc, this.onSignIn}) : super(key: key);

  static Widget create(BuildContext context){
    final auth = Provider.of<AuthBase>(context, listen:  false);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (_, bloc,__) => HomeScreen(bloc: bloc,),
      ),
      );
  }

  final Function(User)? onSignIn;

  Future<void> _signInAnonymously(BuildContext context) async {
    try {     
      await bloc.signInAnonymously();
    }on Exception catch (e) {
      print(e);
    } 
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    }on Exception catch (e) {
      print(e);
    } 
  }

  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of<SignInBloc>(context, listen:  false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Time Tracker",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: StreamBuilder<bool>(
        stream: bloc.isLoadingStream,
        initialData: false,
        builder: (context, snapshot) {
          return _buildContent(context, snapshot.data);
        }
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool? isLoading) {
    return Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginButton(
                onPress: () => _signInWithGoogle(context),
                key: Key("goolge"),
                imgPath: "assets/images/google-logo.png",
                label: "Google",
              ),
              SizedBox(
                height: 16,
              ),
              LoginButton(
                key: Key("guest"),
                imgPath: "assets/images/facebook-logo.png",
                label: "Facebook",
              ),
              SizedBox(
                height: 16,
              ),
              LoginButton(
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                key: Key("email"),
                imgPath: "assets/images/guest.png",
                label: "Email",
              ),
              SizedBox(
                height: 16,
              ),
              GuestButton(
                label: "Guest",
                onPress: () {
                  _signInAnonymously(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListScreen(
                            bloc: bloc,
                                title: "Home",
                              )));
                },
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
