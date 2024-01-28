import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/views/login_screen.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatefulWidget {
  static const String nameKey = "Setting";

  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is ScafullsignOut) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.nameKey, (route) => false);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Setting",
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "Theme",
                    style: Styles.textStyle18,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: primarycolor, style: BorderStyle.solid),
                  ),
                  child: Row(
                    children: [
                      Text(
                          Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? "Dark Theme"
                              : "Light Theme",
                          style: Styles.textStyle18),
                      const Spacer(),
                      PopupMenuButton<String>(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'Light',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.light_mode,
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.light
                                      ? Colors.amber
                                      : Colors.black,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Light Theme',
                                  style: Styles.textStyle16,
                                ),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'Dark',
                            child: Row(
                              children: [
                                Icon(Icons.dark_mode),
                                SizedBox(width: 5),
                                Text('Dark Theme'),
                              ],
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'Light') {
                            MyBloc.get(context).changeTheam(ThemeMode.light);
                          } else if (value == 'Dark') {
                            MyBloc.get(context).changeTheam(ThemeMode.dark);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: CustomButton(
                      onTap: () async {
                        await MyBloc.get(context).signOut();
                      },
                      text: "LogOut",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
