import 'package:nike_app/models/User.dart';

class UserService {
  static final List<User> _users = [];

  // Create
  static void addUser(User user) {
    _users.add(user);
  }

 // Read
static User? getUserByEmail(String email) {
  try {
    return _users.firstWhere((user) => user.email == email);
  } catch (e) {
    return null; 
  }
}


  // Update
  static void updateUser(String email, User newUser) {
    int index = _users.indexWhere((user) => user.email == email);
    if (index != -1) {
      _users[index] = newUser;
    }
  }

  // Delete
  static void deleteUser(String email) {
    _users.removeWhere((user) => user.email == email);
  }

  // Get All Users (Optional)
  static List<User> getAllUsers() {
    return _users;
  }
}
