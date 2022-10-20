import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> weathers = [
      {'city': '深圳', 'temp': 22, 'high': 27, 'low': 18, 'weather': '多云'},
      {'city': '三亚', 'temp': 24, 'high': 25, 'low': 21, 'weather': '小雨'},
      {'city': '成都', 'temp': 18, 'high': 24, 'low': 14, 'weather': '多云'},
      {'city': '北京', 'temp': 10, 'high': 15, 'low': 6, 'weather': '晴'},
      {'city': '上海', 'temp': 12, 'high': 17, 'low': 8, 'weather': '晴'},
      {'city': '广州', 'temp': 20, 'high': 25, 'low': 16, 'weather': '多云'},
      {'city': '杭州', 'temp': 14, 'high': 19, 'low': 10, 'weather': '晴'},
    ];

    return MaterialApp(
      title: 'My Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Weather App'),
        ),
        body: Center(
          child: Column(
            children: [
              ...[
                for (var weather in weathers)
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey.shade200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(weather['city'],
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text('${weather['temp']}°',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(weather['weather']),
                              Text(
                                  '最高 ${weather['high']}° 最低 ${weather['low']}°'),
                            ],
                          ),
                        ],
                      )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
