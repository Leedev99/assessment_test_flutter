import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  // const Tag({Key? key}) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Container(
        child: Center(
          child: Text("Tag",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
