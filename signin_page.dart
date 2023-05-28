import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ultralight_app/main.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget { 
  final String title = 'Registration'; 
  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Sign in', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25.0)),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                final FirebaseUser user = await _auth.currentUser();  // Returns the currently signed-in User or null if there is none.
                if (user == null) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                _signOut();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has successfully signed out.'), // Checks if user already signed out, it will tirgger the provider’s user ID.
                ));
              },
            );
          })
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _EmailPasswordForm(),
          ],
        );
      }),
    );
  }


  void _signOut() async { 
    await _auth.signOut(); // Signs out the current user and clears it from the disk cache.

  }
}

class _EmailPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<_EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,                                
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,         
        children: <Widget>[
          Container(
            child: const Text('Sign in with email and password'),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            maxLength: 10,
            obscureText:true,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) { // User verifies Auth, validates _formkey, verifies result of Auth global key.
                  _signInWithEmailAndPassword();
                  
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _success == null
                  ? ''
                  : (_success
                      ? 'Successfully signed in ' + _userEmail // Checks if user already signed in, it will tirgger the provider’s email.
                      : 'Sign in failed ' 
                    ),
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

    void _pushPage(BuildContext context, Widget page) {   // Push the given route onto the navigator.
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
  void _signInWithEmailAndPassword() async {   
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword( // Tries to sign in a user with the given email address and password, updates onAuthStateChanged.
      
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;         // returns a promise.
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        _pushPage(context, BottomNavBar());
      });
    } else {
      _success = false;
    }
  }
}