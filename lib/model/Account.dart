class Account {
  final int id;
  final String username;
  final String password;
  final String email;

  Account({required this.id, required this.username, required this.password, required this.email});

  factory Account.fromSqfliteDatabase(Map<String, dynamic> map) => Account(
    id: map['id'],
    username: map['username'],
    password: map['password'],
    email: map['email']
  );
}