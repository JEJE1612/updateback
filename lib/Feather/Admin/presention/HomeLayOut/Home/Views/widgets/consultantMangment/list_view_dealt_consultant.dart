import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/delet_items_list.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';

class ListViewDealtConsultant extends StatelessWidget {
  const ListViewDealtConsultant({
    super.key,
    required this.resultlist,
  });

  final List resultlist;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => customLine(),
      itemBuilder: (context, index) {
        return DealtItemslist(
          resultlist: resultlist,
          index: index,
        );
      },
      itemCount: resultlist.length,
    );
  }
}
