import 'package:flutter/material.dart';
import '../../../typo.dart';

class HobbyItem extends StatelessWidget {
  const HobbyItem({required this.icon, required this.label, super.key});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Column(children: [
      Icon(icon),
      const SizedBox(
        height: 10,
      ),
      Text(label, maxLines: 3, textAlign: TextAlign.center, style: textStyle(fontSize: 18, fontFamily: "SourGummy")),
    ]);
}

class Tools extends StatelessWidget {
  const Tools({required this.icon, required this.label, super.key});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Column(children: [
      Icon(icon),
      const SizedBox(
        height: 10,
      ),
      Text(label, maxLines: 3, textAlign: TextAlign.center, style: textStyle(fontSize: 18, fontFamily: "SourGummy")),
    ]);
}
