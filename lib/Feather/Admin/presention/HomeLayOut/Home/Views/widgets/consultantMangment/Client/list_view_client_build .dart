import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/Client/build_client.dart';

class ListViewClientBuild extends StatelessWidget {
  const ListViewClientBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return BuildClient(i: index);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: AdminBloc.get(context).dataclient.length),
    );
  }
}
