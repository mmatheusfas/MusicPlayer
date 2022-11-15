import 'package:app_musicplayer1/controllers/controller_registration.dart';
import 'package:app_musicplayer1/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    String password = '';
    String confirmPassword = '';
    RegistrationController registrationController = RegistrationController();
    var height = MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: formKey,
        child: Container(
            color: Colors.grey.shade900,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextForm(
                  label: "Type your e-mail",
                  icon: Icons.email,
                  controller: registrationController.controllerEmail,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "This field can\t be empty...";
                    }
                    if (!isEmail(text)) {
                      return "This field must be email type...";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextForm(
                  label: "Type your password",
                  controller: registrationController.controllerPassoword,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "This field can\t be empty...";
                    }
                    if (text.length < 6) {
                      return "Password must have at lest 6 characters ...";
                    }
                    return null;
                  },
                  onChanged: (text) => password = text!,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextForm(
                  label: "Confirm your password",
                  onChanged: (text) => confirmPassword = text!,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "This field can\t be empty...";
                    }
                     if (confirmPassword != password) {
                      return "Password and Confirm Password must be equals!";
                    }
                    return null;
                  },
                  icon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        registrationController.createNewUser(
                          registrationController.controllerEmail.text,
                          registrationController.controllerPassoword.text
                        );
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ))
              ],
            )),
      ),
    );
  }
}
