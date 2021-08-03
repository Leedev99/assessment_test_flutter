import 'package:assignment_test/menu.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _genderController = TextEditingController();
  var _phoneController = TextEditingController();
  var _birthdayController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  _selectedDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _birthdayController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final name = TextFormField(
      controller: _nameController,
      validator: RequiredValidator(errorText: 'Please enter name'),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        hintText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Email (Optional)',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );

    final phonenumer = TextFormField(
      controller: _phoneController,
      validator: RequiredValidator(errorText: 'Please put your phone numer'),
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Phone Number (8 Number)',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
    final gender = TextFormField(
      validator: RequiredValidator(errorText: 'Please select Gender'),
      controller: _genderController,
      // keyboardType: TextInputType.values,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.attribution,
        ),
        hintText: 'Gender',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
    final birthday = TextFormField(
      controller: _birthdayController,
      validator: RequiredValidator(errorText: 'Please select date'),
      keyboardType: TextInputType.datetime,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range),
        hintText: 'Birthday',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      onTap: () {
        _selectedDate(context);
      },
    );
    final password = TextFormField(
      controller: _passwordController,
      validator: RequiredValidator(errorText: 'Please put password'),
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          // borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
    final confirmpass = TextFormField(
      controller: _confirmController,
      validator: RequiredValidator(errorText: 'Please confirm password'),
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_rounded),
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(12),
        color: Theme.of(context).primaryColor,
        child: Text(
          'Register',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          //  Navigator.of(context).pushNamed(Menu.tag);
          if (formkey.currentState.validate()) {
            print('Register Click');
            print('Name = ${_nameController.text}');
            print('Email = ${_emailController.text}');
            print('Phone Number = ${_phoneController.text}');
            print('Gender = ${_genderController.text}');
            print('Birthday = ${_birthdayController.text}');
            print('Password = ${_passwordController.text}');
            print('Confirm pass = ${_confirmController.text}');

            MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Menu(),
            );
            Navigator.of(context).pop(materialPageRoute);
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            shrinkWrap: true,
            children: <Widget>[
              name,
              SizedBox(height: 10.0),
              email,
              SizedBox(height: 10.0),
              phonenumer,
              SizedBox(height: 10.0),
              gender,
              SizedBox(height: 10.0),
              birthday,
              SizedBox(height: 10.0),
              password,
              SizedBox(height: 10.0),
              confirmpass,
              SizedBox(height: 10.0),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
