import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';
import 'package:test_americas_health/model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  late final CollectionReference _userCollection;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserRepositoryImpl() {
    _userCollection = FirebaseFirestore.instance.collection('users');
  }
  @override
  Future createUser(UserModel user, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: user.email!, password: password);
      user.userId = result.user!.uid;
      await _userCollection.doc(result.user!.uid).set(user.toMap());
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  @override
  Future<UserModel?> loginUser(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = result.user != null ? await fetcUserInfo(result.user!.uid) : null;
    return user;
  }

  @override
  Future<UserModel> fetcUserInfo(String userId) async {
    final result = await _userCollection.doc(userId).get();
    final user = UserModel.fromMap(result.data() as Map<String, dynamic>);
    return user;
  }

  @override
  Future<UserModel?> fetchCurrentUser() async {
    final result = _auth.currentUser;
    final user = result != null ? await fetcUserInfo(result.uid) : null;
    return user;
  }

  Future logoutUser() async {
    await _auth.signOut();
  }
}
