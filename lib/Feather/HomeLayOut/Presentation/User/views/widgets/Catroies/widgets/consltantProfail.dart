import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/Post/AddPost/NewPost.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/Post/list_post.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/rating/presentation/views/rating_Reviews.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Reating.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/ChatSceen/ChatDeatiles.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/setting.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class ConsltantProfail extends StatelessWidget {
  const ConsltantProfail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  Card(
                    clipBehavior: Clip.none,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        // SocailBloc.get(context).getCover();
                      },
                      child: Container(
                        height: size.height * 0.23,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AssetsData.backGroudprofail,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    child: InkWell(
                      onTap: () {
                        // SocailBloc.get(context).getImageProfail();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.white),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            AssetsData.testImage,
                          ),
                          radius: 48,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Material(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50),
                          child: PopupMenuButton<String>(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'update',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 5),
                                    Text('Edit profail'),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Chat',
                                child: Row(
                                  children: [
                                    Icon(Icons.chat),
                                    SizedBox(width: 5),
                                    Text('Counsult'),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'NewPost',
                                child: Row(
                                  children: [
                                    Icon(Icons.settings),
                                    SizedBox(width: 5),
                                    Text('NewPost'),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'prodelm',
                                child: Row(
                                  children: [
                                    Icon(Icons.horizontal_distribute),
                                    SizedBox(width: 5),
                                    Text('prodelm'),
                                  ],
                                ),
                              ),
                            ],
                            onSelected: (value) {
                              // Handle selection here
                              if (value == 'update') {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => EditProfail(),
                                //   ),
                                // );
                              } else if (value == 'NewPost') {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NewPost(),
                                  ),
                                );
                              } else if (value == 'prodelm') {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Setting(),
                                  ),
                                );
                              } else if (value == 'Chat') {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => chatDeatiles(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    "Ahmed Mohmed",
                    style: Styles.textStyle18,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const BookReating(),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Write BIO",
                          style: Styles.textStyle16.copyWith(
                            color: Theme.of(context).colorScheme.brightness ==
                                    Brightness.dark
                                ? Colors.white
                                : Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Job title",
                          style: Styles.textStyle16.copyWith(
                            color: Theme.of(context).colorScheme.brightness ==
                                    Brightness.dark
                                ? Colors.white
                                : Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "01010657674",
                      style:
                          Styles.textStyle14.copyWith(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const customLine(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SomeWork",
                      style: Styles.textStyle18.copyWith(
                        color: primarycolor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RatingReviews(),
                          ),
                        );
                      },
                      child: Text(
                        "Rating&reviews",
                        style: Styles.textStyle18
                            .copyWith(color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              const customLine(),
              const SizedBox(
                height: 5,
              ),
              const ListViewFeeds(),
            ],
          ),
        ),
      ),
    );
  }
}
