import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> forecast = {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100"
  };

  Map<String, String> location = {
    "city": "Bend",
    "state": "Oregon",
    "zip": "97702"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              
              children: [
                Location(location: location),
                WeatherIcon(condition: forecast['shortForecast']),
                CurrentTempAndWind(
                  temperature: forecast['temperature'],
                  windSpeed: forecast['windSpeed'],
                  windDirection: forecast['windDirection'],
                ),
                DetailedForecast(detailedForecast: forecast['detailedForecast'])
              ],
            )
            ));
  }
}

class DetailedForecast extends StatelessWidget {
  const DetailedForecast({
    super.key,
    required this.detailedForecast,
  });

  final String? detailedForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Detailed forecast:",
              style: TextStyle(fontSize: 20)),
              Text("$detailedForecast")
          ],),
        ],
      ),
    );
  }
}

class CurrentTempAndWind extends StatelessWidget {
  final String? temperature;
  final String? windSpeed;
  final String? windDirection;
  String tempUnits = "F";
  TextStyle style = const TextStyle(
    fontSize: 30
  );

  CurrentTempAndWind({
    super.key,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    String tempUnits = "F",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("$temperature ° $tempUnits", style: style),
        Text("$windSpeed mph $windDirection", style: style)
      ],
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final Map<String, IconData> weatherIcon = {
    "Snowy": Icons.cloudy_snowing,
  };

  WeatherIcon({super.key, required this.condition});

  final String? condition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            weatherIcon[condition],
            size: 100,
          )
        ],
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.location,
  });

  final Map<String, String> location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("${location["city"]}, ${location["state"]} ${location["zip"]}",
        style: const TextStyle(
          fontSize: 25
        ))
      ]),
    );
  }
}
