import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/users_details.dart';

class HeroWidget extends StatelessWidget {
  final String uname;
  final UserDetails currentUser;
  const HeroWidget({
    required this.currentUser,
    required this.uname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: 70,
            height: 70,
            child: Image.asset(
              'assets/image/man.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            uname.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 213, 213, 211),
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$uname@gmail.com',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 213, 213, 211),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            '${currentUser.age} Year\'s',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 213, 213, 211),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            (currentUser.gender.toString()).toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 213, 213, 211),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            indent: 40,
            endIndent: 40,
            color: Colors.grey,
          ),
          SizedBox(
            width: 300,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'I\'m ${currentUser.aType} Employee',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 29, 29, 28),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
