import 'package:flutter/material.dart';
import 'signup_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
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
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Text(
                    'Forget PassWord',
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
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                    ' Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
