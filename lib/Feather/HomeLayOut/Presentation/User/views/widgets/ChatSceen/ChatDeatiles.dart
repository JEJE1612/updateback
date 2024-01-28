import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

chatDeatiles() {
  var massageController = TextEditingController();

  return BlocProvider(
    create: (context) => MyBloc(),
    child: BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        AssetsData.testImage,
                      ),
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ahmed Mohmed",
                      // "${user?.name}",
                      style: Styles.textStyle16.copyWith(
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : scoundColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // SocailBloc.get(context).getChatimage(
                        //   chatImage: '',
                        //   reseverId: user!.uid!,
                        //   dateTime: DateTime.now().toString(),
                        //   text: "",
                        // );
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : scoundColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  height: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return buildMessage();
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: 1),
                ),
                TextFormField(
                  controller: massageController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        // // SocailBloc.get(context).sendMessagechat(
                        // //     reseverId: user!.uid!,
                        // //     dateTime: DateTime.now().toString(),
                        // //     text: massageController.text);
                        // SocailBloc.get(context).sendMessagechat(
                        //   text: massageController.text,
                        //   dateTime: DateTime.now().toString(),
                        //   reseverId: user!.uid!,
                        // );
                        // massageController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                    hintText: "message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Colors.white
                              : scoundColor,
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Colors.white
                              : scoundColor,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Colors.white
                              : scoundColor,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget buildMessage() => Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                topEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
              ),
            ),
            child: const Text(
              "Hello",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
        ],
      ),
    );

Widget buildMyMessage() => Align(
      alignment: AlignmentDirectional.topEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
              ),
            ),
            child: const Text(
              "Hi Ahmed",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          // if (massge?.chatImage != "")
          //   Container(
          //     height: 150,
          //     width: 200,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //           fit: BoxFit.cover, // Adjust the BoxFit as needed
          //           image: NetworkImage(
          //             "${massge?.chatImage}",
          //           ) // Use the message's image URL
          //           ),
          //       borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(10),
          //         bottomLeft: Radius.circular(10),
          //         topRight: Radius.circular(10),
          //       ),
          //     ),
          //   ),

          // ),
        ],
      ),
    );
