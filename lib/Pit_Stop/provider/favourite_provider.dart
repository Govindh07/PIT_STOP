import 'package:android_studio/Pit_Stop/model/car_model.dart';
import 'package:flutter/foundation.dart';


class FavoritesProvider with ChangeNotifier {
  final List<Car> _favorites = [];

  List<Car> get favorites => _favorites;

  void toggleFavorite(Car car) {
    final isExist = _favorites.any((c) => c.name == car.name);
    if (isExist) {
      _favorites.removeWhere((c) => c.name == car.name);
    } else {
      _favorites.add(car);
    }
    notifyListeners();
  }

  bool isFavorite(Car car) {
    return _favorites.any((c) => c.name == car.name);
  }
}
