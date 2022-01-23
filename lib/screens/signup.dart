import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/layout/constant.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginsignup/screens/timeline.dart';
import '../models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

bool _isHidden = true;
final _formKey1 = GlobalKey<FormState>();
final myController = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final _auth = FirebaseAuth.instance;
late String errorMessage;

class _SignUpState extends State<SignUp> {
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
              key: _formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset("assets/images/login1.jpg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 4),
                    child: TextFormField(
                      controller: myController,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter username';
                        return null;
                      },
                      style: new TextStyle(fontSize: 12.0),
                      decoration: new InputDecoration(
                          fillColor: Colors.black26,
                          filled: true,
                          hintText: 'Enter Username',
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
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 4),
                    child: TextFormField(
                      controller: myController2,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter your Email';
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
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
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 4),
                    child: TextFormField(
                      obscureText: _isHidden,
                      controller: myController3,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^.{8,}$');
                        if (value == null || value.isEmpty)
                          return 'Please enter Password';
                        if (!regExp.hasMatch(value)) {
                          return ("Enter valid password min 8 characters ");
                        }
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
                        ),
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CheckerBox(),
                  InkWell(
                    onTap: () {
                      if (_formKey1.currentState!.validate()) {
                        signUp(context);
                      }
                      print(myController.text);
                      print(myController2.text);
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
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: whiteshade),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.18,
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: Text.rich(
                      TextSpan(
                          text: "Already Have An Account? ",
                          style: TextStyle(
                              color: grayshade.withOpacity(0.8), fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: red, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, "/login");
                                    print("Sign in click");
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
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
              activeColor: red,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
                text: "I agree with ",
                style:
                    TextStyle(color: grayshade.withOpacity(0.8), fontSize: 16),
                children: [
                  TextSpan(
                      text: "Terms ",
                      style: TextStyle(color: red, fontSize: 16)),
                  const TextSpan(text: "and "),
                  TextSpan(
                      text: "Policy",
                      style: TextStyle(color: red, fontSize: 16)),
                ]),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputField({Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: grayshade.withOpacity(0.5),
              // border: Border.all(
              //   width: 1,
              // ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;

  InputFieldPassword(
      {Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: grayshade.withOpacity(0.5),
            // border: Border.all(
            //   width: 1,
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              obscureText: _visible,
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}

void signUp(BuildContext context) async {
  if (_formKey1.currentState!.validate()) {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: myController2.text.trim(),
              password: myController3.text.trim())
          .then((value) => {
                postDetailsToFirestore(),
                MyNavigator.GoLogin(context),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errormsg = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errormsg = "Your password is wrong.";
          break;
        case "user-not-found":
          errormsg = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errormsg = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errormsg = "Too many requests";
          break;
        case "operation-not-allowed":
          errormsg = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errormsg = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errormsg);
      print(error.code);
    }
  }
}

postDetailsToFirestore() async {
  // calling firestore and user model, sending values

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = _auth.currentUser;

  User1 userModel =
      User1(myController.text, true, myController2.text, myController3.text);

  await firebaseFirestore
      .collection("users")
      .doc(user!.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Account created successfully :) ");
}
