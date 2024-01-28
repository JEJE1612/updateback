import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSomeWork extends StatefulWidget {
  const AddSomeWork({super.key});

  @override
  State<AddSomeWork> createState() => _AddSomeWorkState();
}

class _AddSomeWorkState extends State<AddSomeWork> {
  var textControll = TextEditingController();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is Removeimagework) {
          MyBloc.get(context).imagework = null;
        } else if (state is ScafullUploadcreatSameWorkState) {
          textControll.clear();
          Navigator.pop(context);
          MyBloc.get(context).imagework = null;
        } else if (state is ScafullCreatSomeWork) {
          textControll.clear();
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
                            title: "Add SomeWork"),
                        MaterialButton(
                          onPressed: () {
                            if (MyBloc.get(context).imagework == null) {
                              MyBloc.get(context).creatSameWork(
                                dateTime: time.toString(),
                                text: textControll.text,
                              );
                            } else {
                              MyBloc.get(context).uploadimagework(
                                date: time.toString(),
                                text: textControll.text,
                                postImage: "",
                              );
                            }
                          },
                          child: const Text(
                            "Addwork",
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
                        hintText: "Add some work",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const customLine(),
                    InkWell(
                      onTap: () {
                        MyBloc.get(context).getimagework();
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
                    if (MyBloc.get(context).imagework != null)
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
                                        MyBloc.get(context).imagework!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                MyBloc.get(context).removeimagework();
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
