import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/list_post_Item_swork.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/rating/presentation/views/rating_Reviews.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/back_ground_profail_user.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/information_user.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfailConsultant extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final UserModel? model;
  ProfailConsultant({
    super.key,
    this.model,
  });

  @override
  State<ProfailConsultant> createState() => _ProfailConsultantState();
}

class _ProfailConsultantState extends State<ProfailConsultant> {
  bool isSomeWorkPressed = true;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is SuccessDeletesomeWorkid) {
          tost(
            text: "Sucessfull Delets",
            state: ToastState.succes,
          );
        }
      },
      builder: (context, state) {
        var model = MyBloc.get(context).usermodel;
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackGroundProfailUser(
                  model: model,
                  size: size,
                ),
                const SizedBox(height: 50),
                InformationUser(
                  model: model,
                ),
                const customLine(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isSomeWorkPressed = !isSomeWorkPressed;
                            // Reset the other button state
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "SomeWork",
                              style: Styles.textStyle18.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              color: isSomeWorkPressed
                                  ? primarycolor
                                  : Colors.transparent,
                              height: 2,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          await BlocProvider.of<RatingCubit>(context)
                              .getAllRating();
                          setState(() {
                            isSomeWorkPressed = !isSomeWorkPressed;

                            // Reset the other button state
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Rating",
                                style: Styles.textStyle18.copyWith(
                                  color:
                                      const Color.fromARGB(255, 172, 102, 102),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                color: isSomeWorkPressed
                                    ? Colors.transparent
                                    : primarycolor,
                                height: 2,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const customLine(),
                const SizedBox(height: 10),
                isSomeWorkPressed ? const ListPostItemswork() : RatingReviews()
              ],
            ),
          ),
        );
      },
    );
  }
}
