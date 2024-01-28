import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/BuildConsulat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewConsultantincategory extends StatelessWidget {
  ListViewConsultantincategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                
                return BuildConsulat(i: index);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: MyBloc.get(context).dataanyconsult.length,
            ),
          );
        });
  }
}
