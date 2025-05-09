import 'package:flutter/material.dart';
import 'package:me/typo.dart';

class HobbyItem extends StatelessWidget {
  const HobbyItem({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(icon),
      SizedBox(
        height: 10,
      ),
      Text(label, maxLines: 3, textAlign: TextAlign.center, style: textStyle(fontSize: 18, fontFamily: "SourGummy")),
    ]);
  }
}

class Tools extends StatelessWidget {
  const Tools({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(icon),
      SizedBox(
        height: 10,
      ),
      Text(label, maxLines: 3, textAlign: TextAlign.center, style: textStyle(fontSize: 18, fontFamily: "SourGummy")),
    ]);
  }
}
