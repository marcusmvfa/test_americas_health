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
  Future addUser(UserModel user) async {
    user.userId = _userCollection.doc().id;
    await _userCollection.add(user.toMap());
  }

  @override
  Future<UserModel> loginUser(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = await fetcUserInfo(result.user!.uid);
    return user;
  }

  @override
  Future<UserModel> fetcUserInfo(String userId) async {
    final result = await _userCollection.doc(userId).get();
    final user = UserModel.fromMap(result.data() as Map<String, dynamic>);
    return user;
  }
}
