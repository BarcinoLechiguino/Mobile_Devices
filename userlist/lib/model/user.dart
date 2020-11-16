class User {
  String username, fullname;
  bool isAdmin;

  User(
    this.username,
    this.fullname, [
    this.isAdmin = false,
  ]);
}
