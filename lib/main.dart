import 'package:assignment_test/menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Menu(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Color(0xFFFEF9EB),
          primaryColor: Colors.orange[900],
        ),
      ),
    );
