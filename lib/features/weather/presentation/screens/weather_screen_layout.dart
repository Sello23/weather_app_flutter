import 'package:flutter/material.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';

class WeatherScreenLayout extends StatelessWidget {
  const WeatherScreenLayout({
    super.key,
    this.weatherData,
  });

  final WeatherData? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/clear_background.png',
                    height: 450,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Column(
                      children: [
                        Text(
                          "20°",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 70.0),
                        ),
                        Text(
                          "SUNNY",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          "20°\nmin",
                          style: TextStyle(fontSize: 17, color: Colors.white, ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          "20°\ncurrent",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 37,
                        child: Text(
                          "20°\nmax",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Tuesday",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              "20°",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Wednesday",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              "20°",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Thursday",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              "20°",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Friday",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              "20°",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Saturday",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              "20°",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
