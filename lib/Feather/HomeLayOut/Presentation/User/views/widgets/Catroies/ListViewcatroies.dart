import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/ListCatroisBuilder.dart';

class ListViewcatroies extends StatelessWidget {
  const ListViewcatroies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const ItemsListCatroies(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 25),
    );
  }
}
