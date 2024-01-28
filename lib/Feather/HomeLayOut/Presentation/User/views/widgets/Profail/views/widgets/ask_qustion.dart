import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AskQustion extends StatefulWidget {
  const AskQustion({super.key});

  @override
  State<AskQustion> createState() => _AskQustionState();
}

class _AskQustionState extends State<AskQustion> {
  var textControll = TextEditingController();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is RemoveAskImage) {
          MyBloc.get(context).imageAsk = null;
        } else if (state is ScafullUploadAskImageState) {
          Navigator.pop(context);
          textControll.clear();
          MyBloc.get(context).imageAsk = null;
        } else if (state is ScafullCreatAskUser) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAppBarAbmin(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: "Ask"),
                        MaterialButton(
                          onPressed: () {
                            if (MyBloc.get(context).imageAsk == null) {
                              MyBloc.get(context).creatAddPhoto(
                                dateTime: time.toString(),
                                text: textControll.text,
                              );
                            } else {
                              MyBloc.get(context).uploadAskImage(
                                date: time.toString(),
                                text: textControll.text,
                                postImage: "",
                              );
                            }
                          },
                          child: const Text(
                            "Ask",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const customLine(),
                    const SizedBox(
                      height: 2,
                    ),
                    if (state is LodingCreatAskUser)
                      const LinearProgressIndicator(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextField(
                      onChanged: (value) {
                        textControll.text = value;
                      },
                      controller: textControll,
                      maxLines: 6,
                      decoration: InputDecoration(
                          hintText: "AskQustion",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const customLine(),
                    InkWell(
                      onTap: () {
                        MyBloc.get(context).getImagePhotogallery();
                      },
                      child: Center(
                        child: Text(
                          "AddPhoto",
                          style: Styles.textStyle20,
                        ),
                      ),
                    ),
                    const customLine(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    if (MyBloc.get(context).imageAsk != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: FileImage(
                                        MyBloc.get(context).imageAsk!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                MyBloc.get(context).removeimagephoto();
                              },
                              icon: const CircleAvatar(
                                child: Icon(
                                  Icons.close_rounded,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
