import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wondervault/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
     systemOverlayStyle:  SystemUiOverlayStyle(
       statusBarColor: Colors.transparent,),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    
      flexibleSpace: Container(
        decoration: const BoxDecoration(
     gradient: LinearGradient(
       begin: Alignment.topLeft,
       end: Alignment.bottomRight,
       colors: [
         red,
         aqua,
       ],
     ),
        ),
      ),
    
      title: Text(
        'WonderVault',
        style: GoogleFonts.bonheurRoyale(
     fontSize: 40,
     fontWeight: FontWeight.bold,
     color: Colors.white,
        ),
      ),
    
      centerTitle: true,
    
      leading: IconButton(
        icon: const Icon(
     Icons.person_outline_rounded,
     color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}