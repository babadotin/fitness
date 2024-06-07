import 'package:fitness/Work_file/bmi_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isButtonEnabled = false;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  String passwordErrorText = '';

  void validateInputs() {
    setState(() {
      isButtonEnabled = usernameController.text.length <= 10 &&
          emailController.text.endsWith('@gmail.com') &&
          passwordController.text == confirmPasswordController.text &&
          isValidPassword(passwordController.text);
    });
  }

  bool isValidPassword(String password) {
    if (password.length < 6) {
      passwordErrorText = 'Password must be at least 6 characters';
      return false;
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      passwordErrorText = 'Password must contain at least one uppercase letter';
      return false;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      passwordErrorText = 'Password must contain at least one lowercase letter';
      return false;
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      passwordErrorText = 'Password must contain at least one digit';
      return false;
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(password)) {
      passwordErrorText =
          'Password must contain at least one special character';
      return false;
    }
    passwordErrorText = '';
    return true;
  }

  @override
  void initState() {
    super.initState();
    usernameController.addListener(validateInputs);
    emailController.addListener(validateInputs);
    passwordController.addListener(validateInputs);
    confirmPasswordController.addListener(validateInputs);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 31, 42, 100),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 31, 42, 100),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: "Username",
                        errorText: usernameController.text.length > 10
                            ? 'Username must be at most 10 characters'
                            : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        fillColor: const Color.fromARGB(255, 24, 33, 83)
                            .withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        errorText: emailController.text.isNotEmpty &&
                                !emailController.text.endsWith('@gmail.com')
                            ? 'Email must end with @gmail.com'
                            : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        fillColor: const Color.fromARGB(255, 24, 33, 83)
                            .withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      errorText: passwordErrorText.isNotEmpty
                          ? passwordErrorText
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      fillColor: const Color.fromARGB(255, 24, 33, 83)
                          .withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: !confirmPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      errorText: confirmPasswordController.text.isNotEmpty &&
                              confirmPasswordController.text !=
                                  passwordController.text
                          ? 'Passwords do not match'
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      fillColor: const Color.fromARGB(255, 24, 33, 83)
                          .withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(confirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BmiPage(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 31, 42, 100),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/icons/pngimg.com - google_PNG19635.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    const Text(
                      "Sign In with Google",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 31, 42, 100),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Color.fromARGB(255, 24, 33, 83)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// A RenderFlex overflowed by 201 pixels on the bottom.
