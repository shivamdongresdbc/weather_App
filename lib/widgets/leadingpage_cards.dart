import 'package:flutter/material.dart';

class CardsCustomLeadimgForPage extends StatefulWidget {
  CardsCustomLeadimgForPage({
    Key? key,
    required this.timing,
    required this.iconss,
    required this.tempreture,
    required this.description,
    required this.timingMinuts,
  }) : super(key: key);

  final String timing;
  final String timingMinuts;
  final iconss;
  final String tempreture;
  final String description;

  @override
  State<CardsCustomLeadimgForPage> createState() =>
      _CardsCustomLeadimgForPageState();
}

class _CardsCustomLeadimgForPageState extends State<CardsCustomLeadimgForPage> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            Row(
              children:[
                Text(
                widget.timing,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
                Text(
                  widget.timingMinuts,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ]
            ),
            //Image.network(

              widget.iconss,
           // ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                widget.description,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Text(
              widget.tempreture,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
