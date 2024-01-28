import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Reating.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/consltantProfail.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class ListOneCiral extends StatelessWidget {
  const ListOneCiral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 30,
        ),
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ListOneCiralBuild(),
      ),
    );
  }
}

class ListOneCiralBuild extends StatelessWidget {
  const ListOneCiralBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ConsltantProfail(),
            ));
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            top: 0,
            child: Container(
              clipBehavior: Clip.none,
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.16,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AssetsData.testImage,
                  ),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            child: BookReating(),
          ),
        ],
      ),
    );
  }
}
