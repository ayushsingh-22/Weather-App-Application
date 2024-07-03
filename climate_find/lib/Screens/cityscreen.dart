import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:climate_find/utilities/constants.dart';
import 'package:climate_find/utilities/cardforfinalpage.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key, required this.data, this.locationerror})
      : super(key: key);

  final String? data;
  final String? locationerror;

  // var decodeddata = jsonDecode(data.body);
  // yha nhi karte apan kuch bhi

  @override
  Widget build(BuildContext context) {
    var content = jsonDecode(data.toString());
    try {
      String locationname = content['location']['name'];
      String countrynname = content['location']['country'];
      String imageaddress = content['current']['condition']['icon'];
      double currenttemp = content['current']['temp_c'];
      String localtime = content['location']['localtime'];
      int humidity = content['current']['humidity'];
      double visiblity = content['current']['vis_km'];
      double windspeed = content['current']['wind_mph'];
      String winddirection = content['current']['wind_dir'];
      // String dayornight = content['current']['is_day'] == 0 ? 'AM' : 'PM';
      //In case agr time 12 hour format mai hota to is trh se AM and Pm kar skte the

      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kUrlforFinal),
              // image: const AssetImage('images/finalpage.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.overlay),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  MyWidget(
                    input: '$locationname,\n$countrynname',
                    color: finalcardcolor,
                    width: 319,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      MyWidget(
                        input: '$currenttemp ℃\n\nCurrent\nTempreture',
                        color: finalcardcolor,
                        height: 142,
                        width: 142,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MyWidget(
                        input: '$localtime\n\nLocal Time',
                        color: finalcardcolor,
                        height: 142,
                        width: 142,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      MyWidget(
                        input: '$humidity\n\nHumidity',
                        color: finalcardcolor,
                        width: 142,
                        height: 142,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyWidget(
                        input: content['current']['condition']['text'],
                        color: finalcardcolor,
                        width: 220,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image(
                          image: NetworkImage('https:$imageaddress'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyWidget(
                        input: 'Visiblity: $visiblity Km',
                        color: finalcardcolor,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      MyWidget(
                        input: 'Windspeed: $windspeed mph $winddirection',
                        color: finalcardcolor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      return Scaffold(
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kUrlforFinal),
              fit: BoxFit.fill,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyWidget(
                input: locationerror ??
                    '\n\n                   $content 🤒  \n\n\nNo such location is found ',
                color: finalcardcolor,
              ),
            ],
          ),
        )),
      );
    }
  }
}
