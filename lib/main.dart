import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(hexColor('#f94144'))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather Forecast',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Color(hexColor('#d00000')),
        ),
        body: _bodyWeather(),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

Widget _bodyWeather() {
  return SingleChildScrollView(
    child: SizedBox(
      height: 1000,
      width: 400,
      child: Column(children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _search(),
                Divider(
                  color: Color(hexColor('#d00000')),
                  height: 30,
                ),
                _city(),
                Divider(
                  color: Color(hexColor('#d00000')),
                  height: 30,
                ),
                _temperatureDetail(),
                Divider(
                  color: Color(hexColor('#d00000')),
                  height: 30,
                ),
                _extraWeather(),
                Divider(
                  color: Color(hexColor('#d00000')),
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        _forecastWeather(),
        SizedBox(
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 170,
              itemCount: 7,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    tileColor: Color(hexColor('#e57373')),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Friday',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '6 °F',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 30),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    ),
                  ),
                );
              })),
        )
      ]),
    ),
  );
}

Row _search() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(width: 20),
      Text(
        'Enter City Name',
        style: TextStyle(fontSize: 20, color: Colors.white),
      )
    ],
  );
}

Row _city() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(
      children: [
        const Text(
          'District of Jambyl, KZ',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        Text(
          'Sunday, Jan 28, 2024',
          style: TextStyle(fontSize: 15, color: Color(hexColor('#dee2e6'))),
        )
      ],
    ),
  ]);
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Color(hexColor('#ffffff')),
        size: 60,
      ),
      const SizedBox(width: 20),
      const Column(
        children: [
          Text(
            '20 °F',
            style: TextStyle(
                fontSize: 45, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            'LIGHT SNOW',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
          )
        ],
      ),
    ],
  );
}

Row _extraWeather() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 25,
          ),
          Text(
            '5 km/hr',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.wb_cloudy,
            color: Colors.white,
            size: 25,
          ),
          Text(
            '18 m/s',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.water_drop,
            color: Colors.white,
            size: 25,
          ),
          Text(
            '80%',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15),
          ),
        ],
      ),
    ],
  );
}

Column _forecastWeather() {
  return const Column(
    children: [
      Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
      ),
    ],
  );
}
