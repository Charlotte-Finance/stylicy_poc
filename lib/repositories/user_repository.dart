import '../models/user/user.dart';

class UserRepository {

  Future<User> getUser() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () =>  const User(
        id: "1",
        username: "Charlotte",
        password: "azerty",
      ),
    );
  }
}
