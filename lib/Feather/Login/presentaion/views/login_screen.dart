import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/home_screen.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/custom_button_auth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/forget_password.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/views/register_screen.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String nameKey = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LodingLoginState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ScafullLoginState) {
            CacheHealper.savedData(key: "uid", value: state.uid);
            tost(text: "Scaffull Login ", state: ToastState.succes);

            FirebaseFirestore.instance
                .collection("user")
                .doc(state.uid)
                .get()
                .then((userData) {
              var userRole = userData['type'];

              if (userRole == 'consulting') {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeCosultant(),
                    ),
                    (route) => false);
                    CacheHealper.savedData(key: "AccountType", value: "consulting");
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeLayOut.nameKey, (route) => false);
                    CacheHealper.savedData(key: "AccountType", value: "client");
              }
            });
          } else if (state is ErrorLoginState) {
            tost(text: "Error Pleas try Again", state: ToastState.eror);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Logo(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Center(
                            child: Text(
                              'Login',
                              style: Styles.textStyle36.copyWith(
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : scoundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.062,
                          ),
                          Text(
                            "Email",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            hinttext: "ُEnter Your Email",
                            mycontroller: email,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.052,
                          ),
                          Text(
                            "password",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          CustomTextForm(
                            suffixIcon: IconButton(
                              onPressed: () {
                                LoginBloc.get(context).changepassWord();
                              },
                              icon: Icon(LoginBloc.get(context).icon),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            hinttext: "ُEnter Your password",
                            mycontroller: password,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                            obscureText: LoginBloc.get(context).obscureText,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Forgetpassword(),
                                  ));
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : scoundColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomButtonAuth(
                              title: "login",
                              onPressed: () async {
                                if (email.text == emailAdimin &&
                                    password.text == passwordAdmin) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AdminHome(),
                                      ));
                                  tost(
                                      text: "Succesfull login Admin",
                                      state: ToastState.succes);
                                } else if (formkey.currentState!.validate()) {
                                  LoginBloc.get(context).loginUser(
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.nameKey);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't Have An Account ? ",
                                  style: Styles.textStyle16.copyWith(
                                    color: Theme.of(context)
                                                .colorScheme
                                                .brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : scoundColor,
                                  ),
                                ),
                                Text(
                                  "Register",
                                  style: Styles.textStyle14
                                      .copyWith(color: primarycolor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
