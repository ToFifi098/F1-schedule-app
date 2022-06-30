import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'F1 schedule',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w900,
          fontSize: 25,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 6, 0),
      centerTitle: true,
    );
  }
}
