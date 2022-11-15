import 'package:app_musicplayer1/controllers/controller_login.dart';
import 'package:app_musicplayer1/views/registration_page.dart';
import 'package:app_musicplayer1/views/root_page.dart';
import 'package:app_musicplayer1/widgets/custom_dialog.dart';
import 'package:app_musicplayer1/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:string_validator/string_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
    var height =MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    var width = MediaQuery.of(context).size.width;
    String result;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Music Player",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Lottie.network(
                  "https://assets6.lottiefiles.com/packages/lf20_pc5bnugy.json",
                  height: height * 0.35,
                  width: width * 0.40,
                  fit: BoxFit.fill,
                ),
              ),
              CustomTextForm(
                label: "E-mail",
                controller: loginController.controllerEmail,
                validator: (text){
                  if (text!.isEmpty) {
                    return "This field can\t be empty...";
                  }
                  if (!isEmail(text)) {
                    return "This field must be email type...";
                  }
                  return null;
                },
                icon: Icons.email,
              ),
             
              SizedBox(
                height: height * 0.05,
              ),
      
              CustomTextForm(
                label: "Password",
                controller: loginController.controllerPassoword,
                validator: (text){
                  if (text!.isEmpty) {
                    return "This field can\t be empty...";
                  }
                  if (text.length < 6) {
                    return "Password must have at lest 6 characters ...";
                  }
                  return null;
                },
                icon: Icons.lock,
                obscureText: true,
              ),
             
              SizedBox(
                height: height * 0.03,
              ),
              GestureDetector(
                onTap: () async{
                  result = await loginController.signInFirebase(
                    loginController.controllerEmail.text,
                    loginController.controllerPassoword.text,
                  );
                  if (result == "Logado") {
                    Future(() async{
                      await Navigator.push(context,MaterialPageRoute(builder: (context) => const RootPage()));
                    }).then((value) => loginController.resetTextFormField());
                  }
                  if (result == "Invalid e-mail or password") {
                    CustomDialog.showCustomDialog(context, result);
                  }
                  if (result == "User not found"){
                    CustomDialog.showCustomDialog(context, result);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.grey, fontSize: 25),
                  ),
                ),
              ), 
              SizedBox(height: height * 0.1,),
              const Text(
                "Don't have a account?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.02,),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                     Future(() async{
                      await Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationPage()));
                    }).then((value) => loginController.resetTextFormField()); 
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)),
                  child: const Text(
                    "Register Now",
                    style: TextStyle(color: Colors.grey, fontSize: 25),
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
