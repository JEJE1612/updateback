part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingSucess extends RatingState {
  final List<RatingModel> allRating;

  RatingSucess({required this.allRating});
}

final class RatingFailure extends RatingState {
  final String errorMessage;

  RatingFailure({required this.errorMessage});
}
