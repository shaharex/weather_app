import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 48, 2),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(children: [
      _headerImage(),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _weatherDescription(),
              const Divider(),
              _temperature(),
              const Divider(),
              _temperatureForecast(),
              const Divider(),
              _footerRatings()
            ],
          ),
        ),
      ),
    ]),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://images.unsplash.com/photo-1431794062232-2a99a5431c6c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed justo placerat, laoreet mauris sed, luctus erat. Sed in felis eu libero vestibulum faucibus at.',
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}

Row _temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        children: [
          Icon(
            Icons.sunny,
            color: Colors.yellow,
            size: 30,
          )
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15° Clear',
                style: TextStyle(color: Colors.deepPurple, fontSize: 18),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Jambyl, Taraz',
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(
      7,
      (int index) {
        return Chip(
          label: Text(
            '${index + 20}°C',
            style: const TextStyle(fontSize: 10),
          ),
          avatar: const Icon(Icons.wb_cloudy),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey)),
          backgroundColor: Colors.grey.shade100,
        );
      },
    ),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[600],
      ),
      const Icon(
        Icons.star,
        size: 20,
        color: Colors.black,
      ),
      const Icon(
        Icons.star,
        size: 20,
        color: Colors.black,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      const Text(
        'to learn more: weather.com',
        style: TextStyle(fontSize: 16),
      ),
      stars
    ],
  );
}
