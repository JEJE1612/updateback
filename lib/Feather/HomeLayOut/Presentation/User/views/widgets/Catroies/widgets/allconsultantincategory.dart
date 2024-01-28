import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/list_account_incategory.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/catroies_model.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllConaltanttogatogry extends StatelessWidget {
  AllConaltanttogatogry(String? text, {super.key, required this.model});
  final CatroiesModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(listener: (context, state) {
      
    
    
    }, builder: (context, state) {
  MyBloc.get(context).getAllcosultant(model.text);
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        MyBloc.get(context).dataanyconsult.clear;
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      )),
                  Text(
                    "All conslutant",
                    style: Styles.textStyle20,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ListViewConsultantincategory(),
            ]),
          ),
        ),
      );
    });
  }
}
