import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase/Screens/Weather%20Screens/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class WeatherScreens extends StatefulWidget {
  const WeatherScreens({Key? key}) : super(key: key);

  @override
  State<WeatherScreens> createState() => _WeatherScreensState();
}

class _WeatherScreensState extends State<WeatherScreens> {

  var updateTime = DateFormat("hh:mm a").format(DateTime.now());
  WeatherData weatherData= WeatherData();
  var currentAddress;
  var lat;
  var lon;
   getData() async{
     var url = "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=cf2a92535defdde87ee15e0e131be067";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode==200){
      var responseBody=jsonDecode(response.body);
      setState((){
        weatherData=WeatherData.fromJson(responseBody);

      });
      // print(weatherData.current!.feelsLike.toString()+"?????????");

    }
}
@override
  initState()  {
     getAllData();
    super.initState();
  }
  getAllData()async{
    await getLocation();
    // await placeName();
   await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.purple.shade700])
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Weather", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: weatherData.current == null
              ? CircularProgressIndicator(
            backgroundColor: Colors.white,
          ) : Container(
              height: 650,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  // child: Text(weatherData.timezone.toString())
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 123,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  ///Column 1
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.water_drop, size: 30, color: Colors.white,),
                                      Icon(Icons.waves, size: 30, color: Colors.white,),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  ///Column 2
                                  Column(
                                    children: [
                                      Text("Humidity", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                      Text(weatherData.current!.humidity.toString(), style: TextStyle(color: Colors.white),),
                                      SizedBox(height: 18,),
                                      Text("Wind Speed", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                      Text(weatherData.current!.windSpeed.toString(), style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                  Spacer(),
                                  ///Column 3
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.visibility, size: 30,color: Colors.white,),
                                      Icon(Icons.speed, size: 30,color: Colors.white,),

                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  ///Column 4
                                  Column(
                                    children: [
                                      Text("Visibility", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                      Text(weatherData.current!.visibility.toString(), style: TextStyle(color: Colors.white),),
                                      SizedBox(height: 18,),
                                      Text("Pressure", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                      Text(weatherData.current!.pressure.toString(), style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // TextField(
                          //   decoration: InputDecoration(hintText: 'Search City',
                          //       border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none), borderRadius: BorderRadius.all(Radius.circular(30)
                          //       ),),
                          //       filled: true,
                          //       fillColor: Colors.grey.shade300
                          //   ),
                          // ),
                          SizedBox(height: 20,),
                          Text(currentAddress, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_pin, color: Colors.white, size: 15,),
                              Text(lon.toString(), style: TextStyle(color: Colors.white),),
                              Text(" , ", style: TextStyle(color: Colors.white),),
                              Text(lat.toString(), style: TextStyle(color: Colors.white),)
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text((weatherData.current!.temp!-273.15).toString().substring(0, 2)+ " C", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200,color: Colors.white),),
                                  Text("Feels like  " + (weatherData.current!.feelsLike!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Icon(Icons.cloud, size: 80, color: Colors.white,)
                            ],
                          ),
                          SizedBox(height: 30,),
                          Text(weatherData.current!.weather![0].description!, style: TextStyle(fontSize: 25, color: Colors.white),),
                          SizedBox(height: 65,),
                          IconButton(onPressed: (){
                            setState(() {
                              getData();
                              updateTime = DateFormat("hh:mm a").format(DateTime.now());
                            });
                          }
                              , icon: Icon(Icons.refresh, color: Colors.white, size: 30,)),
                          SizedBox(height: 60,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Text("Fri", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![0].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.sunny, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Sat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![1].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.cloudy_snowing, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Sun", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![2].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.cloudy_snowing, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Mon", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![3].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.cloud, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Tue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![4].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.sunny, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Wed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![5].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.cloudy_snowing, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Thu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![6].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.cloud, color: Colors.white,),
                                SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text("Fri", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    Text((weatherData.daily![7].temp!.day!-273.15).toString().substring(0, 2), style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.sunny, color: Colors.white,),
                                SizedBox(width: 20,),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later, color: Colors.grey.shade400,),
                              SizedBox(width: 10,),
                              Text("Last Updated on $updateTime", style: TextStyle(color: Colors.grey.shade400),),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                  ),
                ),
              ),
            ),
        ),
        ),
    );
  }
/// Current Location

  getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("PerMission Not Given")));
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        lon = currentPosition.longitude;
        lat = currentPosition.latitude;

      });

      }
    List<Placemark> placemarks =
    await placemarkFromCoordinates(lat, lon);

    Placemark name = placemarks[0];
    setState(() {
      currentAddress =
      '${name.subLocality}, ${name.locality}, ${name.country}';
    });

      // List<Placemark> placemarks =
      // await placemarkFromCoordinates(lat, lon);

      // Placemark place1 = placemarks[0];
      // setState(() {
      //   currentAddress =
      //   "${place1.name} ${place1.subLocality} ${place1.country}";
      // });
      // print(currentAddress);
      // print(lat);
      // print(lon);
    }


// getName() async{
//   GeoCode geoCode = GeoCode();
//   print(lat);
//   print(lon);
//
//
//   Address address = await geoCode.reverseGeocoding(latitude: 74.2733887, longitude: 31.4580092);
//
//   setState(() {
//     currentAddress="${address.countryName}";
//
//   });
//   print(currentAddress);
// }

// getName()async{
//   List<Placemark> placemarks = await placemarkFromCoordinates(
//       74.2733887, 31.4580092);
//   var add;
//
//   Placemark place = placemarks[0];
//   setState(() {
//
//     add =
//     '${place.locality}, ${place.country}';
//     print("outSide state");
//     print(add);
//
//
//     // '${place.postalCode}, ${place.name}, ${place.street},${place.subLocality} ${place.locality}, ${place.country}';
//   });
//   print("outSide state");
//   print(add);
// }

  }






