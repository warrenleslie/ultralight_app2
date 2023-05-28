import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Registration';

  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Register', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25.0)),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Form(
        key: _formKey, 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,          
        children: <Widget>[
           Container(
            child: const Text('Tell us who you are'),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value) {
                if (value.isEmpty)  {
                  return 'Email is required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              maxLength: 10,
              validator: (String value) {
                if (value.isEmpty)  {
                  return 'Password is required';
                }
                return null;
              },
            ),
            Container(padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) { // Validates every FormField that is a descendant of this Form, and returns true if there are no errors.
                  _register();
                }
              },
              child: const Text(
                'Submit',
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16),
                  ),
            ),
          ),
          Container(
            alignment: Alignment.center, 
            child: Text(_success == null
              ? ''
              : (_success
                  ? 'Successfully registered ' + _userEmail // Checks if user successfully registered.
                  : 'Registration failed ' 
                  
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    @override
    void dispose()  {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void _register() async {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword( // Tries to create a new user account with the given email address and password.
        email: _emailController.text, 
        password: _passwordController.text,
      ))
          .user;            // represents a user.
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        _success = false;  
      }
    }
  }