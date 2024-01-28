import 'package:flutter/material.dart';

class Logoapp extends StatelessWidget {
  const Logoapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
          "   AssetsData.logo",
        )),
      ),
    );
  }
}
