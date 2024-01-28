import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/consltantProfail.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class NewPost extends StatelessWidget {
  static const String nameKey = "NewPost";
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    var textControll = TextEditingController();
    //  DateTime time = DateTime.now();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 5),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // SocailBloc.get(context).getPost();
                      // SocailBloc.get(context).posts.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConsltantProfail(),
                          ));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  ),
                  Text(
                    " Add work",
                    style: Styles.textStyle18,
                  ),
                ],
              ),

              const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AssetsData.logo),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "AhmedMohmed",
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),

              Expanded(
                child: TextFormField(
                  controller: textControll,
                  decoration: const InputDecoration(
                    hintText: "  what is your mined.....",
                    border: InputBorder.none,
                  ),
                ),
              ),
              // if (SocailBloc.get(context).imagepost != null)
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: const DecorationImage(
                            image: AssetImage(
                              AssetsData.backGroudprofail,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // SocailBloc.get(context).removeImgePOst();
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
              const Divider(height: 20, thickness: 0.5, color: Colors.grey),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 34,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo_camera_front_rounded,
                        size: 34,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
