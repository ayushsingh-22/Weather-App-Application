import 'cityscreen.dart';
import 'package:flutter/material.dart';
import 'package:climate_find/utilities/constants.dart';
import 'package:http/http.dart' as http;

class NamedCity extends StatelessWidget {
  const NamedCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('images/namedcity.jpg'),
              image: NetworkImage(kUrlfornamedcity),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.overlay),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              TextField(
                onSubmitted: ((value) async {
                  var namedcityurl = Uri.parse(
                      'http://api.weatherapi.com/v1/current.json?key=$apikey&q=$value');
                  var weatherdata = await http.get(namedcityurl);
                  if (weatherdata.statusCode == 200) {
                    // var jsondecodeddata = ;
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen(data: weatherdata.body);
                        },
                      ),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen(
                              data: weatherdata.statusCode.toString());
                        },
                      ),
                    );
                  }
                }),
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hoverColor: Colors.white,
                  hintText: 'Enter City Name',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: kHeadtext,
                ),
                style: kHeadtext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
