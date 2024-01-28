import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/custom_button_auth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forgetpassword extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Forgetpassword({super.key});

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
            Navigator.pushNamedAndRemoveUntil(
                context, HomeLayOut.nameKey, (route) => false);
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
                              'Forget Password',
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
                                debugPrint("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.052,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButtonAuth(
                              title: "send",
                              onPressed: () {
                                LoginBloc.get(context)
                                    .resetpassword(email.text, context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
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
