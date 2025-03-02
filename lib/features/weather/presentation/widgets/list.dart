import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
 
  final String data;
  final String weatherDay;
  final String maxTemp;
  final String minTemp;

  const MyListTile({
    super.key,
  
    required this.data,
    required this.weatherDay,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
    
      title: Text(
        data,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weatherDay,
            style: TextStyle(color:Colors.black),
          ),
          Text(
            "Max: $maxTemp",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Min: $minTemp",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}