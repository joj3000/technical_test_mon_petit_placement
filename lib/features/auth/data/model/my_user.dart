class MyUser {
  final String? id;

  const MyUser({this.id});

  factory MyUser.none() {
    return const MyUser();
  }
}
