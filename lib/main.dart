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
          child: ListView(
            children: [
              ...[
                for (var weather in weathers) WeatherRow(weather: weather),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherRow extends StatefulWidget {
  const WeatherRow({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Map<String, dynamic> weather;

  @override
  State<WeatherRow> createState() => _WeatherRowState();
}

class _WeatherRowState extends State<WeatherRow> {
  bool favorite = false;
  // DECLARE Favorite: BOOLEAN
  // Favorite <- FALSE
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(8),
        color: Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(widget.weather['city'],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                MaterialButton(
                    child: Row(children: [
                      favorite
                          ? const Icon(Icons.star, color: Colors.amber)
                          : const Icon(Icons.star_outline),
                      // IF Favorite = TRUE THEN
                      //   "已收藏"
                      // ELSE
                      //   "收藏"
                      // ENDIF
                      Container(
                        width: 8,
                      ),
                      Text(favorite ? "已收藏" : "收藏",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ]),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    }),
                const Spacer(),
                Text('${widget.weather['temp']}°',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.weather['weather']),
                Text(
                    '最高 ${widget.weather['high']}° 最低 ${widget.weather['low']}°'),
              ],
            ),
          ],
        ));
  }
}
