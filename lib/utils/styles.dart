import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

final kHeadingTextStyle = GoogleFonts.dmSans(
  color: AppColors.headingColor,
  fontWeight: FontWeight.w900,
  fontSize: 30.0,
  letterSpacing: -0.7,
);

final kLogoTextStyle = GoogleFonts.dmSans(
  color: AppColors.primary,
  fontWeight: FontWeight.w900,
  fontSize: 64.0,
  letterSpacing: -0.5,
);

final kButtonLightTextStyle = GoogleFonts.dmSans(
  color: AppColors.lightTextColor,
  fontWeight: FontWeight.w700,
  fontSize: 18.0,
  letterSpacing: 0,

);

final kButtonDarkTextStyle = GoogleFonts.dmSans(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 18.0,
  letterSpacing: 0,
);

final kAppBarTitleTextStyle = GoogleFonts.dmSans(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.7,
);


final kButtonLight = TextStyle(
  color: AppColors.primary,
  fontSize: 30,
  letterSpacing: 0,
);
