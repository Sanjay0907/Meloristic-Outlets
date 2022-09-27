import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meloristicoutlets/views/account/create_account.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'controller/provider/google_sign_in_provider.dart';
import 'sign_in_logic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MeloristicOutlets());
}

class MeloristicOutlets extends StatelessWidget {
  const MeloristicOutlets({Key? key}) : super(key: key);

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
