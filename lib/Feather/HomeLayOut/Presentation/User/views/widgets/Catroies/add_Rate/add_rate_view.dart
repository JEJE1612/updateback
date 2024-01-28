import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/add_Rate/widgets/create_rate_button.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/add_Rate/widgets/rating_bar_view.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRatingView extends StatelessWidget {
  const AddRatingView(
      {super.key, required this.onPressed, required this.buttonName});
  final VoidCallback onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Form(
          key: BlocProvider.of<RatingCubit>(context).ratingKey,
          child: CustomTextForm(
            hinttext: "Describe your rating ",
            mycontroller:
                BlocProvider.of<RatingCubit>(context).ratingController,
            keyboardType: TextInputType.multiline,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Field cannot be empty';
              } else {
                return null;
              }
            },
            textAlign: TextAlign.center,
            minlines: 4,
            maxlines: 8,
          ),
        ),
        const SizedBox(height: 16),
        const RatingBarView(),
        const SizedBox(height: 16),
        CreateRatingButton(
          buttonName: buttonName,
          onPressed: () async {
            if (BlocProvider.of<RatingCubit>(context)
                .ratingKey
                .currentState!
                .validate()) {
              onPressed();
              Navigator.pop(context);
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
