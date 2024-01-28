import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Allconslatme.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class ItemsListCatroies extends StatelessWidget {
  const ItemsListCatroies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllConaltant(),
            ));
      },
      child: Image.asset(
        AssetsData.logo,
        fit: BoxFit.cover,
      ),
    );
  }
}
