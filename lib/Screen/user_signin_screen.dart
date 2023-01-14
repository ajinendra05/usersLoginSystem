import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../data/boxes.dart';
import '../data/colors.dart';
import '../model/users_details.dart';
import '../widgets/user_signin_widget.dart';

class UserSignInScreen extends StatefulWidget {
  const UserSignInScreen({super.key});

  @override
  State<UserSignInScreen> createState() => _UserSignInScreenState();
}

class _UserSignInScreenState extends State<UserSignInScreen> {
  final avatarColors = avatarsColors;
  @override
  Widget build(BuildContext context) {
    context.read<UserProvider>().fetchData;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(151, 57, 97, 1),
          title: const Text(
            'Sign in',
            style: TextStyle(
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        body: Consumer<UserProvider>(
          builder: (context, value, child) {
            final users = value.users;
            return ListView.builder(
              itemBuilder: (context, index) {
                return UserSignin(
                  user: users[index],
                  userName: users[index].name,
                  avatarColor: avatarColors[index % 5],
                );
              },
              itemCount: users.length,
            );
          },
        ));
  }
}
