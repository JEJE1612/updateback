import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/post_items_some_work.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class ListPostItemswork extends StatelessWidget {
  const ListPostItemswork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myBloc = MyBloc.get(context);

    if (myBloc.someWorkid.isEmpty) {
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
      itemCount: myBloc.someWorkid.length,
      itemBuilder: (context, index) => PostItemsSomeWork(
        model: myBloc.someWork[index],
      ),
    );
  }
}
