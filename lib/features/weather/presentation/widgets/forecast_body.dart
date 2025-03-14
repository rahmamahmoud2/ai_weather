

import 'package:ai_wheather/features/weather/domain/entity/repo_entity.dart';
import 'package:ai_wheather/features/weather/presentation/widgets/ai_prediction_button.dart';
import 'package:ai_wheather/features/weather/presentation/widgets/list.dart';
import 'package:flutter/material.dart';

class ForecastScreenBody extends StatelessWidget {
  const ForecastScreenBody({super.key, required this.response});

  final ResponseEntity response;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
    
    image: DecorationImage(fit: BoxFit.cover,
      image: AssetImage('assets/images/cover.jpg',)
    ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.05,
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "hello",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ]
            ),
          ),

          SizedBox(height: 20),

    
          if (response.forecast?.forecastday != null &&
              response.forecast!.forecastday!.isNotEmpty)
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              padding: EdgeInsets.all(15),
              height: height * 0.3,
              decoration: BoxDecoration(
                color: const Color.fromARGB(37, 255, 255, 255).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    response.forecast!.forecastday![0].date ?? "Today",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
              
                  Text(
                    "${response.forecast!.forecastday![0].day?.avgtempC ?? ''}°C",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    response.forecast!.forecastday![0].day?.condition?.text ??
                        "Clear",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _weatherDetail("Max",
                          "${response.forecast!.forecastday![0].day?.maxtempC ?? ''}°C"),
                      _weatherDetail("Min",
                          "${response.forecast!.forecastday![0].day?.mintempC ?? ''}°C"),
                      _weatherDetail("Wind",
                          "${response.forecast!.forecastday![0].day?.maxwindKph ?? ''} kph"),
                    ],
                  ),
                ],
              ),
            ),

          SizedBox(height: 20),

    
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              itemCount: response.forecast?.forecastday?.length ?? 0,
              itemBuilder: (context, index) {
                if (index == 0)
                  return SizedBox(); 
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 12),
                  child: MyListTile(

                    data: response.forecast!.forecastday![index].date ?? "",
                    weatherDay:
                        "${response.forecast!.forecastday![index].day?.avgtempC ?? ''}°C",
                    maxTemp:
                        "${response.forecast!.forecastday![index].day?.maxtempC ?? ''}°C",
                    minTemp:
                        "${response.forecast!.forecastday![index].day?.mintempC ?? ''}°C",
                  ),
                );
              },
            ),
          ),
         AIPredictionButton(weatherData: response),
        ],
      ),
    );
  }

  Widget _weatherDetail(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}