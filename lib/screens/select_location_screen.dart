import 'package:flutter/material.dart';
import 'package:task_day4/screens/home_screen.dart';
import 'package:task_day4/services/weather_services.dart';
import 'package:task_day4/widgets/custom_elevated_button.dart';
import 'package:task_day4/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});
  static const String routeName = '/SelectLocationScreen';

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final TextEditingController _cityController = TextEditingController();
  final WeatherService weatherService = WeatherService(Dio());
  bool isLoading = false;

  void _getWeatherAndNavigate() async {
    setState(() {
      isLoading = true;
    });
    try {
      final weatherModel = await weatherService.getCurrentWeather(
        cityName: _cityController.text.trim(),
      );
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(weatherModel: weatherModel),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Color(0XFF08244F)),
              )
              : Padding(
                padding: const EdgeInsets.only(top: 64, left: 24, right: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/W.png',
                          height: 109,
                          width: 99,
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              'weather',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'App',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF808080),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/Sun cloud angled rain.png',
                      height: 207,
                      width: 284,
                    ),
                    SizedBox(height: 70),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(controller: _cityController),
                        ),
                        SizedBox(width: 16),
                        CustomElevatedButton(
                          text: 'check',
                          onTap: _getWeatherAndNavigate,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
