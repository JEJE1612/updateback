import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/Model/rating_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());
  final ratingController = TextEditingController();
  final ratingKey = GlobalKey<FormState>();
  double ratingValue = 0.0;
  Future<void> addRating(BuildContext context) async {
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    await rating.doc(rating.doc().id).set(
      {
        "uid": BlocProvider.of<MyBloc>(context).usermodel!.uid,
        kDescribeRating: ratingController.text,
        kRateValue: ratingValue.toString(),
        kUserName: BlocProvider.of<MyBloc>(context).usermodel!.name,
        kImage: BlocProvider.of<MyBloc>(context).usermodel!.image,
        "dateTime": DateTime.now(),
        "documentId": rating.doc().id,
      },
    );
  }

  Future<void> updateRate(RatingModel rate) async {
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    await rating.doc(rate.documentId).update({
      "dateTime": DateTime.now(),
      kRateValue: ratingValue.toString(),
      kDescribeRating: ratingController.text,
      kUserName: rate.userName,
      "documentId": rate.documentId,
      kImage: rate.image,
      'uid': rate.uid,
    });
    await getAllRating();
  }

  Future<void> deleteRate(String documentId) async {
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    await rating.doc(documentId).delete();
    await getAllRating();
  }

  Future<void> getAllRating() async {
    emit(RatingLoading());
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    List<RatingModel> allRating = [];
    try {
      await rating
          .orderBy("dateTime", descending: true)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          allRating.add(
              RatingModel.fromjson(rate: doc.data() as Map<String, dynamic>));
        });
      });
      emit(RatingSucess(allRating: allRating));
    } on Exception catch (e) {
      emit(RatingFailure(errorMessage: e.toString()));
    }
  }
}
