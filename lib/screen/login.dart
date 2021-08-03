
import 'package:assignment_test/config/authservice.dart';
import 'package:assignment_test/menu.dart';
import 'package:assignment_test/model/user.dart';
import 'package:assignment_test/screen/menu/home.dart';
import 'package:assignment_test/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

final formkey = GlobalKey<FormState>();
final phoneController = TextEditingController();
final passController = TextEditingController();
User user = User();
AutherService autherService = AutherService();

class _LoginPageState extends State<LoginPage> {
  bool StatusRedeye = true;

Widget buildForgotPassbtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      padding: EdgeInsets.only(right: 5),
      child: Text(
        'Forget Password?',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        print('Forgot Password');
      },
    ),
  );
}

void showAlertDialog(String title, String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

Widget BuildSingUpBtn() {
  return GestureDetector(
    onTap: () {
      print('Register click');
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Register(),

            );Navigator.of(context).push(materialPageRoute);
    },
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Not a member?',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(text: ' '),
        TextSpan(
          text: 'Register',
          style: TextStyle(
              color: Colors.orange[900],
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )
      ]),
    ),
  );
}

Widget horizontaLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 80,
        height: 1.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );

Widget buildLoginBtn() {
  return Container(
    padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 30.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        if (formkey.currentState.validate()) {
          print(
              'Phone Number ${phoneController.text} Password ${passController.text}');
          formkey.currentState.save();
          autherService.login(user: user).then((result) {
            if (result) {
              //todo
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Home(),

            );Navigator.of(context).pop(materialPageRoute);
            } else {
               showAlertDialog('Warning','Phone number or Password',context);
            }
          });
        }
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.orange[900],
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 80.0,
                    child: Image.asset('images/login.png'),
                  ),
                  TextFormField(
                    controller: phoneController,
                    validator: RequiredValidator(
                        errorText: 'Please enter your phone number'),
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Phone Number(8 Number)',
                      contentPadding:
                          EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    onSaved: (String value) {
                      user.Username = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passController,
                    validator:
                        RequiredValidator(errorText: 'Please enter password'),
                    autofocus: false,
                    obscureText: StatusRedeye,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            StatusRedeye = !StatusRedeye;
                          });
                        },
                        icon: StatusRedeye
                            ? Icon(
                                Icons.remove_red_eye,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                      ),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    onSaved: (String value) {
                      user.Passpword = value;
                    },
                  ),
                  buildForgotPassbtn(),
                  buildLoginBtn(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      horizontaLine(),
                      Text(
                        'Quikly login With',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      horizontaLine(),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  BuildSingUpBtn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
