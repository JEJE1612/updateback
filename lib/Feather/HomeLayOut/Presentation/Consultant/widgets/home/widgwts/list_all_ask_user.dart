import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/home/widgwts/build_post_items.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class ListAllAskUser extends StatelessWidget {
  const ListAllAskUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myBloc = MyBloc.get(context);

    if (myBloc.allAsk.isEmpty) {
      return Center(
        child: Text(
          ' Add Some Work ',
          style: Styles.textStyle20,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: myBloc.allAsk.length,
      itemBuilder: (context, index) => PostItemsAllAsk(
        model: myBloc.allAsk[index],
      ),
    );
  }
}
