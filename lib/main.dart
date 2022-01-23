import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/others/signup.dart';
import 'package:loginsignup/providers/clubs_provider.dart';
import 'package:loginsignup/screens/all_clubs.dart';
import 'package:loginsignup/screens/club_requests.dart';
import 'package:loginsignup/screens/feed.dart';
import 'package:loginsignup/screens/gallery.dart';
import 'package:loginsignup/screens/location_view.dart';
import 'package:loginsignup/screens/manage_clubs.dart';
import 'package:loginsignup/screens/profile.dart';
import 'package:loginsignup/screens/request_club.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/screens/signin_admin.dart';
import 'package:loginsignup/screens/notifications.dart';
import 'package:loginsignup/screens/splash_screen.dart';
import 'package:loginsignup/screens/timeline.dart';
import 'package:loginsignup/services/authentication_service.dart';
import 'package:loginsignup/services/fire_store_services.dart';
import 'package:provider/provider.dart';
import 'models/club.dart';
import 'screens/add_club.dart';
import 'screens/admin_homepage.dart';
import 'package:firebase_core/firebase_core.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Signin(),
  "/signup": (BuildContext context) => SignUp(),
  "/admin": (BuildContext context) => AdminHomePage(),
  "/create": (BuildContext context) => addClub(),
  "/manage": (BuildContext context) => ManageClubs(),
  "/feed": (BuildContext context) => Feed(),
  "/gallery": (BuildContext context) => Gallery(),
  "/request_club": (BuildContext context) => requestClub(),
  "/all_clubs": (BuildContext context) => AllClubs(),
  "/profile": (BuildContext context) => ClubProfile(index: null,),
  "/timeline": (BuildContext context) => Timeline(),
  "/location_view": (BuildContext context) => locationview(),
  "/club_requests": (BuildContext context) => ClubRequests(),
};
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  imageCache?.clear();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  final _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final firestoreService = FireStoreServicesx();
    final firebaseUser = context.watch<User?>();
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(create: (context) => ClubsProvider()),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null),
        StreamProvider<List<Club>>(
          create: (context) => firestoreService.getClub(),
          initialData: [],
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.red, accentColor: Colors.yellowAccent),
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                return SplashScreen();
              } else {
                return SplashScreen();
              }
            },
          ),
          routes: routes),
    );
  }
}
