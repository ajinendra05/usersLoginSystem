import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/boxes.dart';
import '../widgets/hero.dart';
import '../model/users_details.dart';

class Profile extends StatelessWidget {
  final UserDetails currentUser;
  static String routeName = 'profileScreen';
  const Profile({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 19, 32),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 57, 97, 1),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Boxes.getUser().listenable(),
        builder: (context, value, child) {
          final cuser = value.get(currentUser.id);
          return Column(
            children: [
              HeroWidget(
                currentUser: cuser!,
                uname: currentUser.name,
              ),
            ],
          );
        },
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intern_assignment/widgets/hero.dart';
// import '../model/users_details.dart';

// class Profile extends StatelessWidget {
//   final UserDetails currentUser;
//   static String routeName = 'profileScreen';
//   const Profile({super.key, required this.currentUser});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 200, 200, 200),
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(151, 57, 97, 1),
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             fontFamily: 'Pacifico',
//           ),
//         ),
//       ),
//       body: Column(children: [
//         heroWidget(
//           uname: currentUser.name,
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 15),
//           child: Text(
//             overflow: TextOverflow.ellipsis,
//             'Age',
//             style: GoogleFonts.nunito(
//                 fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
//           ),
//         ),
//       ]),
//     );
//   }
// }
