import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ShowCatroies/list_view_catrios_show.dart';

class ShowCatroies extends StatelessWidget {
  const ShowCatroies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomAppBarAbmin(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "Show Catroies"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListViewCatriosShow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
