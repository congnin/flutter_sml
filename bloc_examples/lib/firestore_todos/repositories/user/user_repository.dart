import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  Future<String> getUserId();

  Future<String> getUser();

  Future<FirebaseUser> signInWithGoogle();

  Future<void> signInWithCredentials(String email, String password);

  Future<void> signUp({String email, String password});

  Future<void> signOut();
}
