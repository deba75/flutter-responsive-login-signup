import 'package:flutter/material.dart';
import 'package:responsive_signup/pages/login_new.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14141d),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/signin.png'),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(147, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.white30),
                        suffixIcon: Icon(Icons.email, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6b63ff), width: 2),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(147, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(color: Colors.white30),
                        suffixIcon: Icon(Icons.phone, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6b63ff), width: 2),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(147, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.white30),
                        suffixIcon: Icon(Icons.password_rounded, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6b63ff), width: 2),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(147, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Confirm your password",
                        hintStyle: TextStyle(color: Colors.white30),
                        suffixIcon: Icon(Icons.password_rounded, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6b63ff), width: 2),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Sign Up button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6b63ff),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white38,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
