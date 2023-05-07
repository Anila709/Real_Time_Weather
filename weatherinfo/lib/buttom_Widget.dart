import 'package:flutter/material.dart';
import 'models.dart';

// ignore: must_be_immutable
class SecondContainer extends StatefulWidget {
  const SecondContainer(WeatherResponse? response, {super.key, this.weather});

  final weather;

  @override
  State<SecondContainer> createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, right: 10, bottom: 20),
                  width: 40,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 228, 216, 223),
                    image: DecorationImage(
                        image: AssetImage('images/cloud1.png'),
                        alignment: Alignment.topCenter),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      _response != null
                          ? '${_response?.weatherInfo.description}'
                          : 'loading',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, top: 20, right: 20, bottom: 20),
                  width: 40,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 228, 216, 223),
                    image: DecorationImage(
                        image: AssetImage('images/temperature.png'),
                        alignment: Alignment.topCenter),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'Temperature',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 10, right: 10, bottom: 20),
                  width: 40,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 228, 216, 223),
                    image: DecorationImage(
                        image: AssetImage('images/humidity.png'),
                        alignment: Alignment.topCenter),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'Humidity',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, top: 10, right: 20, bottom: 20),
                  width: 40,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 228, 216, 223),
                    image: DecorationImage(
                        image: AssetImage('images/wind.png'),
                        alignment: Alignment.topCenter),
                  ),
                  //child: const Text('50 km/h'),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'Wind Speed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
