import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/list_view_catrois_build.dart';

class ShowAllConaltant extends StatelessWidget {
  const ShowAllConaltant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomAppBarAbmin(
              onPressed: () {
                Navigator.pop(context);
              },
              title: " All Conaltant",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ListViewCatroisBuild(),
          ]),
        ),
      ),
    );
  }
}
