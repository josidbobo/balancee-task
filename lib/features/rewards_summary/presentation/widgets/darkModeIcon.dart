import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/styles/themes/theme.dart';
import '../../../../core/styles/themes/themeProvider.dart';

class ThemeToggleButton extends StatelessWidget {
  final ThemeProvider prov;
  const ThemeToggleButton(this.prov, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: prov.toggleTheme,
                child: Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 6, right: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 14 / 2,),
                  decoration: BoxDecoration(
                    color: prov.themeData.canvasColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                   // border: Border.all(color: prov.themeData.colorScheme.primary)
                   ),
                    child: IconButton(icon: Icon(prov.themeData == AppThemes.dark ? CupertinoIcons.brightness : CupertinoIcons.moon), onPressed: prov.toggleTheme, color: prov.themeData.colorScheme.primary,)),
              );
  }
}