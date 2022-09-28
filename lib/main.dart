import 'package:buffer/controller/provider/google_sign_in_provider.dart';
import 'package:buffer/views/auth/sign_in_logic.dart';
import 'package:buffer/views/home/homepage.dart';
import 'package:buffer/views/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  runApp(const MakeMyDay());
}

// FlutterNativeSplash.remove();
class MakeMyDay extends StatelessWidget {
  const MakeMyDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<GoogleSignInProvider>(
                create: (context) => GoogleSignInProvider()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignInLogic(),
          ),
        );
      },
    );
  }
}
