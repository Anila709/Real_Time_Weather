import 'package:flutter/material.dart';
import 'package:weatherinfo/data_service.dart';
import 'package:weatherinfo/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              // height: MediaQuery.of(context).size.height / 3,
              // width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(242, 34, 84, 1),
              // decoration: const BoxDecoration(
              //   color: Color.fromARGB(255, 240, 14, 86),
              //   image: DecorationImage(
              //     image: AssetImage('images/map.jpg'),
              //     fit: BoxFit.fill,
              //     opacity: 480,
              //   ),
              // ),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 15, left: 20, right: 20),
                      child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: Colors.white54,
                          ),
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.search,
                                  color: Colors.white54),
                              onPressed: _search),
                          hintStyle: const TextStyle(color: Colors.white54),
                          hintText: 'Search city'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white54),
                          ),
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (_response != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Column(
                          children: [
                            Image.network('${_response?.iconUrl}'),
                            const SizedBox(height: 3),
                            Text(
                              _response != null
                                  ? '${_response?.tempInfo.temperature} \u00B0 C'
                                  : 'loading',
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _response != null
                                  ? '${_response?.weatherInfo.description}'
                                  : 'loading',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ]),
            ),
            // SecondContainer(_response)
            Container(
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
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              _response != null
                                  ? '${_response?.weatherInfo.description}'
                                  : 'loading',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              _response != null
                                  ? '${_response?.tempInfo.temperature} \u00B0 C'
                                  : 'loading',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              _response != null
                                  ? '${_response?.humidityInfo.humidity}' + ' %'
                                  : 'loading',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              _response != null
                                  ? '${_response?.windspeedInfo.windspeed}' +
                                      ' km/h'
                                  : 'loading',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
            ),
          ],
        ),
      )),
    );
  }

  void _search() async {
    try {
      final response = await _dataService.getWeather(_cityTextController.text);
      setState(() => _response = response);
    } catch (e) {
      print(e);
    }
  }
}
