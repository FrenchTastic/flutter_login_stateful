import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      validator: (value) {
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password', 
        hintText: 'Password',
      ),
      validator: (value) {
        if (value.length < 4) {
          return 'Password must be at least 4 characters';
        }
      }
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit!'),
      onPressed: () {
        print(this.formKey.currentState.validate());
      },
      color: Colors.blue,
    );
  }
}