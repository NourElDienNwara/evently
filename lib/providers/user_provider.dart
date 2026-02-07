import 'package:evently/firebase_serves.dart';
import 'package:evently/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsFavoriteEvent(String eventID) {
    return currentUser!.favoriteEventIDs.contains(eventID);
  }

  void addEventToFavorite(String eventID) {
    FirebaseServes.addEventToFavorite(eventID);
    currentUser!.favoriteEventIDs.add(eventID);
    notifyListeners();
  }


   void removeEventFromFavorite(String eventID) {
    FirebaseServes.removeEventFromFavorite(eventID);
    currentUser!.favoriteEventIDs.remove(eventID);
    notifyListeners();
  }
}
