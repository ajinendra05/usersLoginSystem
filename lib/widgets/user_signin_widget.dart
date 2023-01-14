import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../Screen/profile.dart';
import '../data/boxes.dart';
import '../model/users_details.dart';
import '../widgets/dialog_widget.dart';

class UserSignin extends StatelessWidget {
  const UserSignin(
      {super.key,
      required this.userName,
      required this.avatarColor,
      required this.user});
  final UserDetails user;
  final String userName;
  final Color avatarColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Boxes.getUser().listenable(),
        builder: (context, boxvalue, child) {
          final currentUser = boxvalue.get(user.id);
          if (user == currentUser) {
            user.setActive();
          }
          return InkWell(
            onTap: () async {
              if (user.isactive) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profile(
                    currentUser: user,
                  ),
                ));
              } else {
                showDialog(
                  barrierColor: const Color.fromARGB(181, 20, 20, 20),
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      user: user,
                    );
                  },
                );
              }
            },
            splashColor: const Color.fromRGBO(151, 57, 97, 1),
            borderRadius: BorderRadius.circular(15),
            child: Card(
              margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              elevation: 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: avatarColor,
                          child: Center(
                            child: Text(
                              userName.substring(0, 2),
                              style: const TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          userName,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (user.isactive) {
                        user.setInactive();
                        boxvalue.delete(user.id);
                        Provider.of<UserProvider>(context).dataChange();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: user.isactive
                          ? const Color.fromRGBO(151, 57, 97, 1)
                          : Colors.transparent,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      alignment: Alignment.centerRight,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      user.isactive ? 'Sign Out' : "Sign in",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight:
                            user.isactive ? FontWeight.w100 : FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
