import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/Client/list_view_client_build%20.dart';

class ShowAllClient extends StatelessWidget {
  const ShowAllClient({super.key});

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
              // ignore: prefer_const_constructors
              title: "All Client",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const ListViewClientBuild(),
          ]),
        ),
      ),
    );
  }
}
