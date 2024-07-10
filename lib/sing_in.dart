import 'package:dessert_delivery_app/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "username": _usernameController.text,
      };
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(data: data)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/sing_in_screen.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 55, top: 14),
            child: Text(
              "Welcome to \nour dessert \ndelivery app",
              style: TextStyle(
                  fontFamily: "BalooThambi",
                  color: Colors.white,
                  fontSize: 50,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    )
                  ]),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(
                left: 45, right: 45, top: 250, bottom: 100),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 45,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "create account",
                    style: TextStyle(fontFamily: "BalooThambi", fontSize: 24),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  buildPasswordField("password", true, _passwordController,
                      (String? value) {
                    if (value!.isEmpty) {
                      return "please enter a password";
                    }
                    if (value.length < 8) {
                      return "please enter a 8-digit password";
                    }
                    return null;
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  buildPasswordField("email", false, _emailController,
                      (String? value) {
                    if (value!.isEmpty) {
                      return "please enter a email";
                    }
                    RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_ `{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
                    if (!emailRegExp.hasMatch(value)) {
                      return "please enter a valid email";
                    }
                    return null;
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  buildPasswordField("username", false, _usernameController,
                      (String? value) {
                    if (value!.isEmpty) {
                      return "please enter a username";
                    }
                    return null;
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7851A1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 120.0),
                    ),
                    child: const Text(
                      'sing in',
                      style: TextStyle(
                        fontFamily: 'BalooThambi',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270, left: 330),
            child: Image.asset(
              "assets/images/ice_cream1.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600, left: 20),
            child: Image.asset(
              "assets/images/ice_cream2.png",
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPasswordField(String hint, bool isPassword,
    TextEditingController controller, var validator) {
  return TextFormField(
    validator: validator,
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontFamily: 'BalooThambi2',
        color: Colors.black,
      ),
      filled: true,
      fillColor: Colors.grey[200],
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide.none,
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
    ),
    style: const TextStyle(
      fontFamily: 'CustomFont', // Замените на имя вашего шрифта
    ),
  );
}
