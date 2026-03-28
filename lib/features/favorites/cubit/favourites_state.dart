part of 'favourites_cubit.dart';

abstract class FavouritesState {
  final List<CourseModel> favoriteCourses;
  const FavouritesState(this.favoriteCourses);
}

class FavouritesInitial extends FavouritesState {
  const FavouritesInitial(super.favoriteCourses);
}

class FavouritesLoaded extends FavouritesState {
  const FavouritesLoaded(super.favoriteCourses);
}
