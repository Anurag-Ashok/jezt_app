import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jezt_app/const.dart';
import 'package:weather/weather.dart';

class whetherPage extends StatefulWidget {
  const whetherPage({super.key});

  @override
  State<whetherPage> createState() => _whetherPageState();
}

class _whetherPageState extends State<whetherPage> {
  final WeatherFactory _wf = WeatherFactory(OPEN_WEATHER_KEY);
  Weather? _weather;
  bool loading = true;

  @override
  void initState() {
    _wf.fiveDayForecastByCityName("kakkanad").then((w) {
      setState(() {
        _weather = w.first;
      });
    });
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = _weather!.date!;
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 176, 224, 230),
      body: loading == true
          ? CircularProgressIndicator(
              color: Colors.black,
            )
          : SafeArea(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 198, 121, 5),
                            size: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _weather?.areaName ?? "",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateFormat("EEEE").format(now),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "  ${DateFormat("d.mm.y").format(now)}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.network(
                      "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°	C",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _weather?.weatherDescription ?? "",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: size.width * 0.8,
                          height: size.height * 0.2,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Max:${_weather?.tempMax?.celsius?.toStringAsFixed(0)}°	C",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Min:${_weather?.tempMin?.celsius?.toStringAsFixed(0)}°	C",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Wind:${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Humidity:${_weather?.humidity?.toStringAsFixed(0)}%",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
