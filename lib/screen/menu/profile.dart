import 'package:assignment_test/screen/login.dart';
import 'package:assignment_test/screen/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      );
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print('Click');
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => Register(),
                        );
                        Navigator.of(context).push(materialPageRoute);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
