import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/add_some_work.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/EditProfail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/ask_qustion.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';

class BackGroundProfailUser extends StatelessWidget {
  const BackGroundProfailUser({
    super.key,
    required this.size,
    required this.model,
  });

  final Size size;
  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        Card(
          clipBehavior: Clip.none,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          elevation: 0.0,
          child: Container(
            height: size.height * 0.23,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "${model?.cover}",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 4, color: Colors.white),
                color: Colors.white),
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                model!.image!,
              ),
              radius: 48,
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
                    if (model?.type == 'client')
                    const PopupMenuItem(
                      value: 'Ask',
                      child: Row(
                        children: [
                          Icon(Icons.question_mark),
                          SizedBox(width: 5),
                          Text('Ask Question'),
                        ],
                      ),
                    ),
                    if (model?.type != 'client')
                      const PopupMenuItem(
                        value: 'work',
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.note_add_outlined,
                                ),
                                SizedBox(width: 5),
                                Text('Add Some Work'),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                  onSelected: (value) {
                    // Handle selection here
                    if (value == 'update') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfailUser(),
                        ),
                      );
                    } else if (value == 'Ask') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AskQustion(),
                          ));
                    } else if (value == "work") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddSomeWork(),
                          ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
