import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF010F1C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Enter your email and password to securely access your account and manage your services.',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 58, 58, 58),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'email Address ',
                        prefixIcon: Icon(Icons.email, color: Color(0xFF939393)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Color(0xFF939393)),
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xFF939393),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text(
                        'remember me',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'forgot password',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3BB77E),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont have an accout?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text(
                      'Sign Up Here',
                      style: TextStyle(
                        color: Color(0xFF3BB77E),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Divider(color: Colors.black, thickness: 1),
                  SizedBox(height: 30),
                  Text('Or Continue With Accout'),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Icon(Icons.facebook),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'G',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Icon(Icons.apple),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
