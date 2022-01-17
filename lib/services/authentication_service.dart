import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
final FirebaseAuth _firebaseAuth;

AuthenticationService(this._firebaseAuth);

Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

Future<String> Signin({required String email, required String password}) async {
	try {
	await _firebaseAuth.signInWithEmailAndPassword(
		email: email, password: password);

	return "Signed In";
	} on FirebaseAuthException catch (e) {
	  print(e.message);
		return e.message;
	}
	}
}

Future<String> SignUp({String email, String password}) async {
	try {
	await _firebaseAuth.createUserWithEmailAndPassword(
		email: email, password: password);
	return "Signed Up";
	} on FirebaseAuthException catch (e) {
	if (e.code == 'weak-password') {
		print(e.message);
		return e.message;
	} else if (e.code == 'email-already-in-use') {
		print(e.message);
		return e.message;
	} else {
		print(e.message);
		return e.message;
	}
	} catch (e) {
	print(e);
	}
}

