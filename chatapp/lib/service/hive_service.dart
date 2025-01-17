import 'package:hive/hive.dart';
import 'package:chatapp/model/user.dart';

class HiveService {
  // Open the 'users' box
  Future<Box<User>> openUserBox() async {
    return await Hive.openBox<User>('users');
  }

  // Save user to Hive
  Future<void> saveUser(User user) async {
    var box = await openUserBox();
    await box.add(user);
  }

  // Get all users from Hive
  Future<List<User>> getAllUsers() async {
    var box = await openUserBox();
    return box.values.toList();
  }

  // Authenticate user by email and password
  Future<bool> authenticateUser(String email, String password) async {
    var box = await openUserBox();
    for (var user in box.values) {
      if (user.email == email && user.password == password) {
        return true; // User found with matching credentials
      }
    }
    return false; // No match found
  }
}
