import 'package:flutter/material.dart';

import '../themes/styles.dart';

class DocText24BlueBold extends StatelessWidget {
  const DocText24BlueBold({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    debugPrint("${"*-* " * 10} build from DocText24BlueBold ${"*-* " * 10}");
    return Text(text, style: TextStyles.font24BlueBold,);
  }
}
