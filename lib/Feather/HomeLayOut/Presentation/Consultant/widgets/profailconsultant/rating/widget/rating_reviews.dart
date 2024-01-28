import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/rating_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, RatingState>(
      builder: (context, state) {
        if (state is RatingLoading) {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 5,
          ));
        } else if (state is RatingSucess) {
          return RatingView(
            allRating: state.allRating,
          );
        } else if (state is RatingFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(
            child: MaterialButton(
              onPressed: () async {
                await BlocProvider.of<RatingCubit>(context).getAllRating();
              },
              child: Text("Update"),
              color: Colors.grey,
            ),
          );
        }
      },
    );
  }
}