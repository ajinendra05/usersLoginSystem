import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'Screen/user_signin_screen.dart';
import '/model/users_details.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/user_signin_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsAdapter());
  await Hive.openBox<UserDetails>('CurrentUser');

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const UserSignInScreen(),
        );
      },
    ),
  );
}
