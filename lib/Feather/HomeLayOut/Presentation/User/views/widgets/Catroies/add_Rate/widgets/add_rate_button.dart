import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/add_Rate/add_rate_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRatingButton extends StatefulWidget {
  const AddRatingButton({super.key});

  @override
  State<AddRatingButton> createState() => _AddRatingButtonState();
}

class _AddRatingButtonState extends State<AddRatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddRatingView(
              buttonName: "Create",
              onPressed: () async {
                await BlocProvider.of<RatingCubit>(context).addRating(context);
              },
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
