import 'package:flutter/material.dart';

import '../../../typo.dart';
import '../../about/widget/tile.dart';

class ExperienceSection extends StatelessWidget {

  const ExperienceSection({
    required this.time, required this.delegation, required this.company, required this.location, required this.description, super.key,
  });
  final String time;
  final String delegation;
  final String company;
  final String location;
  final String description;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double screenWidth = mediaQueryData.size.width;
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HorizontalLine(
                title: delegation,
                edgeInsets: EdgeInsets.symmetric(vertical: mediaQueryData.size.width * 0.018),
              ),
              Text(
                time,
                style: textStyle(
                  fontSize: 22,
                  fontFamily: "Rubik",
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company,
                    style: textStyle(
                      fontSize: 14,
                      color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                      wght: 420,
                      fontFamily: "Rubik",
                    )),
                Text(location,
                    style: textStyle(
                      fontSize: 14,
                      color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                      wght: 420,
                      fontFamily: "Rubik",
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    right: mediaQueryData.size.width * 0.15,
                    top: mediaQueryData.size.width * 0.02,
                  ),
                  child: Text(
                    description,
                    style: textStyle(fontFamily: "Rubik", fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
