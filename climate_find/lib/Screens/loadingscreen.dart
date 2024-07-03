import 'package:climate_find/Screens/cityscreen.dart';
import 'package:climate_find/Screens/namedcityscreen.dart';
import 'package:climate_find/Services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_find/utilities/cardforfinalpage.dart';
import 'package:climate_find/utilities/constants.dart';

// spinkit() {
//   return const Scaffold(
//       body: SpinKitSquareCircle(
//     color: Colors.white,
//     size: 50.0,
//   ));
// }

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Climate app'),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(kUrlforMain),
                // image: const AssetImage('images/mainpic.jpg'),
                // wo better view isse aa nhi rha hai asset wle se isliye sidhe url wla load karo
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1), BlendMode.overlay)),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(
                      'WEATHER  AROUND',
                      style: kHeadtext,
                    ),
                    const SizedBox(
                      height: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MyCustomButton(
                        requiredjob: (() async {
                          var weatherdata = await getlocation();

                          if (weatherdata.statusCode == 200) {
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
                                    data: weatherdata.statusCode.toString(),
                                    locationerror:
                                        "Device Location is Off 😵 \n\n\n\nKindly Turn it On 😊",
                                  );
                                },
                              ),
                            );
                          }
                        }),
                        text: 'For Current Location',
                        enterstyle: kSubHeadtext,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MyCustomButton(
                        requiredjob: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const NamedCity();
                              },
                            ),
                          );
                        }),
                        text: 'For Specified Location',
                        enterstyle: kSubHeadtext,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
