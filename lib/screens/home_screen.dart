import 'package:flutter/material.dart';
import 'package:task_day4/models/weather_model.dart';
import 'package:task_day4/widgets/custom_container_day.dart';
import 'package:task_day4/widgets/custom_container_weather.dart';
import 'package:task_day4/widgets/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  static const String routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0XFF08244F), Color(0XFF134CB5), Color(0XFF0B42AB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      weatherModel.name ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/Sun cloud angled rain.png',
                  height: 207,
                  width: 284,
                ),
                Text(
                  '${weatherModel.main?.temp?.round() ?? 0}°',
                  style: const TextStyle(
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w600,
                    fontSize: 64,
                    color: Colors.white,
                  ),
                ),
                Text(
                  weatherModel.weather?.first.description ?? '',
                  style: const TextStyle(
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Max.:',
                          style: TextStyle(
                            fontFamily: 'SF',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' ${weatherModel.main?.tempMax?.round() ?? 0}°',
                          style: const TextStyle(
                            fontFamily: 'SF',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Text(
                          'Min.:',
                          style: TextStyle(
                            fontFamily: 'SF',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' ${weatherModel.main?.tempMin?.round() ?? 0}°',
                          style: const TextStyle(
                            fontFamily: 'SF',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomContainerWeather(weatherModel: weatherModel),

                const SizedBox(height: 20),
                const CustomContainerDay(),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'back',
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed('/SelectLocationScreen');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
