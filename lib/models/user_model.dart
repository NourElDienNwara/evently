class UserModel {
  String id;
  String userName;
  String email;
  List<String> favoriteEventIDs;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.favoriteEventIDs,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'email': email,
    'favoriteEventIDs': favoriteEventIDs,
  };

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        userName: json['userName'],
        email: json['email'],
        favoriteEventIDs: (json['favoriteEventIDs'] as List).cast<String>(),
      );
}
