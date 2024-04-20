import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  final signUpUrl = '127.0.0.1:8000/register';

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse(signUpUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": userNameController.text,
          "password": passwordController.text,
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sign Up Succesfull")));
      Navigator.pushNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Your Password is weak/user already exists"),
      ));
    }
  }
  @override
  void initState(){
    super.initState();
  }
  bool passWordChecker(TextEditingController p1,TextEditingController p2){
    if (p1==p2){
      return true;
    } else{
      return false;
    }
  }

  void _displaySnackBar(SnackBar s){
    ScaffoldMessenger.of(context).showSnackBar(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:  [
          Image.asset("assets/images/pooram.jpeg",fit: BoxFit.cover,height: double.infinity,),
          Container(decoration:const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: <Color>[Colors.transparent,Color.fromARGB(255, 0, 0, 0)],stops: [0.25,0.9])
          ),),
          Padding(
          padding:const EdgeInsets.all(25.0),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  SizedBox(height: 345,),
              const SizedBox(height: 18,),
              TextField(
                obscureText: false,
                style:const TextStyle(color: Colors.white),
                controller: userNameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                  suffixIcon:const Icon(Icons.person,color: Colors.white,)
                ),
              ),
              const SizedBox(height: 18,),
              TextField(
                obscureText: true,
                style:const TextStyle(color: Colors.white),
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle:const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: const Icon(Icons.password,color: Colors.white,)
                ),
              ),
              const SizedBox(height: 18,),
              TextField(
                obscureText: true,
                style:const TextStyle(color: Colors.white),
                controller: ConfirmPasswordController,
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  hintStyle:const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: const Icon(Icons.password,color: Colors.white,)
                ),
              )
              ,const SizedBox(height: 35,),
              ElevatedButton(onPressed: (){ if (passWordChecker(passwordController,ConfirmPasswordController)){
                sendPostRequest();
              } else {
                print("password mismatch detected");
                final snackBar= SnackBar(content: Text("Please check your password"));
                _displaySnackBar(snackBar);
              }},
              child: Text("Sign-Up",style: TextStyle(fontSize:18,color: Colors.white ),),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStateProperty.all(const Size(double.infinity,50)),backgroundColor:MaterialStateProperty.all(Color(0xff4782ba)) )),
            ],),
          ),
        )],
      ),
    );
  }
}
class SlideRightRoute extends PageRouteBuilder {
 final Widget page;

 SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
