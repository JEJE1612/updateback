import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/general%20consultant/build_client.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';

class ListViewConsultantBuild extends StatelessWidget {
  const ListViewConsultantBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Buildconsultantgeneral(i: index);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: MyBloc.get(context).datagenaralconsult.length),
    );
  }
}
