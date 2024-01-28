import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class Prodlem extends StatelessWidget {
  const Prodlem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBarAbmin(
              onPressed: () {
                Navigator.pop(context);
              },
              title: "Prodlem"),
          const SizedBox(
            height: 10,
          ),
          const ListViewProdlem(),
        ],
      )),
    );
  }
}

class ListViewProdlem extends StatelessWidget {
  const ListViewProdlem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(
          height: 3,
        ),
        itemBuilder: (context, index) => const ProdlemItems(),
      ),
    );
  }
}

class ProdlemItems extends StatelessWidget {
  const ProdlemItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 20.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    AssetsData.testImage,
                  ),
                  radius: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AhmedMohmed",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        "20/5/20210",
                        style: TextStyle(fontSize: 12, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      AssetsData.logo,
                    ),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AhmedMohmed",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
