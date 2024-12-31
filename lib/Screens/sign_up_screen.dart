import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FC),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Username Field
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        // Confirm Password Field
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),

                        // Sign Up Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Signing Up...')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Already have an account link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          // Navigate to login page (if you have one)
                        },
                        child: Text('Login'),
                      ),
                    ],
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
