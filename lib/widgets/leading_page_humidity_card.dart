import 'package:flutter/material.dart';

class LeadingPageHumidityCard extends StatefulWidget {
  LeadingPageHumidityCard(
      {Key? key,
        required this.name,
        required this.number,
        required this.icon,
        required this.airPolution
      })
      : super(key: key);

  final String name;
  final String number;
  final IconData icon;
  final String airPolution;

  @override
  State<LeadingPageHumidityCard> createState() =>
      _LeadingPageHumidityCardState();
}

class _LeadingPageHumidityCardState extends State<LeadingPageHumidityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.transparent, width: 1)),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 49,
                ),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                widget.number,

              ),
              Text(
                widget.airPolution,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
