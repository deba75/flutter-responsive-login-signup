import 'package:flutter/material.dart';
import 'package:responsive_signup/pages/signUp.dart';
import 'package:responsive_signup/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  // Text controllers for form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Animation controller
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  // Form key for validation
  final _formKey = GlobalKey<FormState>();
  
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    
    // Start the animation
    _animationController.forward();
  }
    
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // Email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  
  // Password validation
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  
  // Login logic
  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      
      // Simulate login process
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        
        // Navigate to home page
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14141d),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard when tapping outside
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height - 30,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image takes up 30% of the height
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        child: Image.asset(
                          'images/signin.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                      // Form takes up the rest
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome!",
                                  style: TextStyle(
                                    fontSize: 34,
                                    color: const Color.fromARGB(184, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                
                                Text(
                                  "LogIn",
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                
                                SizedBox(height: 30),
                                
                                // Email field
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: const Color.fromARGB(147, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                
                                TextFormField(
                                  controller: _emailController,
                                  style: TextStyle(color: Colors.white),
                                  validator: _validateEmail,
                                  keyboardType: TextInputType.emailAddress,
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
                                    errorStyle: TextStyle(color: Colors.redAccent),
                                  ),
                                ),
                                
                                SizedBox(height: 20),
                                
                                // Password field
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: const Color.fromARGB(147, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                
                                TextFormField(
                                  controller: _passwordController,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: !_isPasswordVisible,
                                  validator: _validatePassword,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    hintStyle: TextStyle(color: Colors.white30),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      },
                                      child: Icon(
                                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white38),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff6b63ff), width: 2),
                                    ),
                                    errorStyle: TextStyle(color: Colors.redAccent),
                                  ),
                                ),
                                
                                SizedBox(height: 20),
                                
                                // Forgot password link
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Show a custom dialog
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Color(0xff1a1a24),
                                              title: Text(
                                                "Reset Password",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              content: TextField(
                                                decoration: InputDecoration(
                                                  hintText: "Enter your email",
                                                  hintStyle: TextStyle(color: Colors.white54),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white38),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xff6b63ff)),
                                                  ),
                                                ),
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(color: Colors.white70),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text("Password reset link sent to your email!"),
                                                        backgroundColor: Color(0xff6b63ff),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    "Send Link",
                                                    style: TextStyle(color: Color(0xff6b63ff)),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xff6b63ff),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                
                                Spacer(),
                                
                                // Login and Signup buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Sign up button
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation, secondaryAnimation) => Signup(),
                                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                              var begin = Offset(1.0, 0.0);
                                              var end = Offset.zero;
                                              var curve = Curves.ease;
                                              
                                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                              var offsetAnimation = animation.drive(tween);
                                              
                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Color(0xff6b63ff),
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff6b63ff).withOpacity(0.3),
                                              blurRadius: 10,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "SignUp",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                    // Login button with animation
                                    InkWell(
                                      onTap: _isLoading ? null : _login,
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: 150,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: _isLoading ? Color(0xffD0CFFF) : Colors.white,
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: _isLoading 
                                            ? SizedBox(
                                                height: 20, 
                                                width: 20, 
                                                child: CircularProgressIndicator(
                                                  color: Color(0xff6b63ff),
                                                  strokeWidth: 2,
                                                )
                                              )
                                            : Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.login,
                                                    color: Color(0xff6b63ff),
                                                    size: 18,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    "LogIn",
                                                    style: TextStyle(
                                                      color: Color(0xff6b63ff),
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
