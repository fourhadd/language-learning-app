import 'package:bloc/bloc.dart';
import '../../../data/models/course_model.dart';
import '../data/favorites_repository.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final FavoritesRepository _repository = FavoritesRepository();

  FavouritesCubit() : super(const FavouritesInitial([])) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favorites = await _repository.getFavorites();
    emit(FavouritesLoaded(favorites));
  }

  Future<void> toggleFavorite(CourseModel course) async {
    final List<CourseModel> currentList = List.from(state.favoriteCourses);

    final bool isExist = currentList.any((e) => e.name == course.name);

    if (isExist) {
      currentList.removeWhere((e) => e.name == course.name);
    } else {
      currentList.add(course);
    }

    emit(FavouritesLoaded(currentList));
    await _repository.saveFavorites(currentList);
  }

  Future<void> clearAll() async {
    await _repository.clearAll();
    emit(const FavouritesLoaded([]));
  }
}
