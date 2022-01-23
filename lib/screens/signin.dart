import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/layout/constant.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginsignup/screens/timeline.dart';
import 'package:loginsignup/screens/feed.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

final _formKey = GlobalKey<FormState>();
final myController5 = TextEditingController();
final myController6 = TextEditingController();
final _auth = FirebaseAuth.instance;
late String errormsg;
void clear() {
  myController5.clear();
  myController6.clear();
}

class _SigninState extends State<Signin> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: whiteshade,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("assets/images/login1.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: TextFormField(
                      controller: myController5,
                      autofocus: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter your email");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Enter a valid email");
                        }
                        return null;
                      },
                      style: new TextStyle(fontSize: 12.0),
                      decoration: new InputDecoration(
                          fillColor: Colors.black26,
                          filled: true,
                          hintText: 'Enter Email',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Password",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: TextFormField(
                      obscureText: true,
                      controller: myController6,
                      autofocus: false,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^.{8,}$');
                        if (value == null || value.isEmpty)
                          return ("Please enter your password");
                        return null;
                      },
                      style: new TextStyle(fontSize: 12.0),
                      decoration: new InputDecoration(
                          fillColor: Colors.black26,
                          filled: true,
                          hintText: 'Enter Password',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                        signIn(context);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text.rich(TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: whiteshade),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.149,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text.rich(
                      TextSpan(
                          text: "Don't Have An Account? ",
                          style: TextStyle(
                              color: grayshade.withOpacity(0.8), fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: red, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                    print("Sign Up click");
                                  }),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade, // color of tick Mark
              activeColor: blue,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
        ],
      ),
    );
  }
}

void signIn(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: myController5.text.trim(),
              password: myController6.text.trim())
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                if (myController5.text == 'admin@gmail.com')
                  {
                    clear(),
                    Navigator.pushReplacementNamed(context, '/admin'),
                  }
                else
                  {
                    clear(),
                    Navigator.pushReplacementNamed(context, '/feed'),
                  }
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errormsg = "Your email address appears to be invalid!";
          break;
        case "wrong-password":
          errormsg = "Wrong password!";
          break;
        case "user-not-found":
          errormsg = "User with this email doesn't exist!";
          break;
        case "too-many-requests":
          errormsg = "Too many requests!";
          break;
        case "operation-not-allowed":
          errormsg = "Signing in with Email and Password is not enabled!";
          break;
        default:
          errormsg = "An undefined Error happened!";
      }
      Fluttertoast.showToast(msg: errormsg);
      print(error.code);
    }
  }
}
