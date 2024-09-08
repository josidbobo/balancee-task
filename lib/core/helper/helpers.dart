import 'package:flutter/material.dart';

import '../utils/constants/color.dart';

// Snackbar for feedback
void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

TextStyle? style(){
  return const TextStyle(fontSize: 13, color: wprimary);
}
