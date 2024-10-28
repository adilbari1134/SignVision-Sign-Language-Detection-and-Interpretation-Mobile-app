import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verifyaccountscreen.dart'; // Ensure this import is correct

class SignUpScreen extends StatefulWidget {
  final bool createAccount;

  const SignUpScreen({super.key, required this.createAccount});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String _email = '';
  String _password = '';
  String _errorMessage = '';
  bool _isPasswordVisible = false; // State to toggle password visibility

  Future<void> _authenticate() async {
    try {
      if (widget.createAccount) {
        await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifiedAccountScreen()));
      } else {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.of(context).pushReplacementNamed('/homescreen');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'email-already-in-use') {
          _errorMessage =
              'The email address is already in use by another account.';
        } else if (e.code == 'invalid-email') {
          _errorMessage = 'The email address is not valid.';
        } else if (e.code == 'weak-password') {
          _errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'user-not-found') {
          _errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          _errorMessage = 'Wrong password provided for that user.';
        } else {
          _errorMessage = e.message ?? 'An error occurred, please try again.';
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.createAccount ? 'Sign Up' : 'Sign In'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(235, 234, 234, 1),
      ),
      body: Container(
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.createAccount)
                    Text('Create Account',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700))
                  else
                    Text('Sign In',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700)),
                  SizedBox(height: 15),
                  if (widget.createAccount)
                    Text(
                      'Create an account to be a member for keeping record of your learnings',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (widget.createAccount) ...[
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.person_outline,
                                  color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon:
                                Icon(Icons.mail_outline, color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon:
                                Icon(Icons.lock_outline, color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            } else if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              return 'Password must contain at least one special character';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                        SizedBox(height: 30),
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                _authenticate();
                              }
                            },
                            child: Text(
                              widget.createAccount ? "Sign Up" : "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(114, 204, 253, 1),
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        if (widget.createAccount) ...[
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already created account?',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => SignUpScreen(
                                              createAccount: false)));
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(7, 82, 123, 1),
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Color.fromRGBO(7, 82, 123, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpScreen(createAccount: true)));
                            },
                            child: Text(
                              'Create Account?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(7, 82, 123, 1),
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromRGBO(7, 82, 123, 1),
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
