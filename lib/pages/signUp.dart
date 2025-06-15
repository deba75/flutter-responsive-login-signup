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
      backgroundColor: const Color(0xff14141d),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/signin.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(147, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.white30),
                      suffixIcon: Icon(Icons.email, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(147, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your phone number",
                      hintStyle: TextStyle(color: Colors.white30),
                      suffixIcon: Icon(Icons.phone, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(147, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.white30),
                      suffixIcon:
                          Icon(Icons.password_rounded, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(147, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Confirm your password",
                      hintStyle: TextStyle(color: Colors.white30),
                      suffixIcon:
                          Icon(Icons.password_rounded, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add sign up logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6b63ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
