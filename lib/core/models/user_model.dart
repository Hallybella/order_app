class AppUser {
  final String uid;
  final String email;

  AppUser({required this.uid, required this.email});

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        uid: map['uid'],
        email: map['email'],
      );
}
