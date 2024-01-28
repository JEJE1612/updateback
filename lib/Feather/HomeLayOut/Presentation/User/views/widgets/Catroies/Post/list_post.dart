import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/Post/BuildPostItems.dart';

class ListViewFeeds extends StatelessWidget {
  const ListViewFeeds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildPostItems(context),
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: 10);
  }
}
