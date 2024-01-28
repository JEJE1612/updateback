import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/add_Rate/widgets/add_rate_button.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          BlocProvider.of<MyBloc>(context).usermodel!.type == "consulting"
              ? null
              : const AddRatingButton(),
      body: Text(""),
    );
  }
}

// class RatingView extends StatelessWidget {
//   const RatingView({
//     super.key,
//     required this.rate,
//   });
//   final List<RatingModel> rate;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ReatingScreen(rate: rate),
//       ),
//     );
//   }
// }


