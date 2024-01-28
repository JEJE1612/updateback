import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/back_ground_profail_user.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/information_user.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/list_post_items_ask.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profail extends StatelessWidget {
  static const String nameKey = "Profail";

  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final UserModel? model;
  Profail({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is SuccessDeleteAskUser) {
          tost(
            text: "Scafull Dealt",
            state: ToastState.succes,
          );
        }
      },
      builder: (context, state) {
        var model = MyBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackGroundProfailUser(size: size, model: model),
                  const SizedBox(
                    height: 50,
                  ),
                  InformationUser(model: model),
                  const customLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  const ListPostItemsAsk(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
