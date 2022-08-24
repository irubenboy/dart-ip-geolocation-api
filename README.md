# ip_geolocation_api

A dart package to get your geolocation data from your IP

## Example

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ip_geolocation_api/ip_geolocation_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';
  GeolocationData? _geolocationData;

  @override
  void initState() {
    super.initState();
    getIp();
  }

  Future<void> getIp() async {
    _geolocationData = await GeolocationApi.getData();
    if (_geolocationData != null) {
      setState(() => text = _geolocationData!.ip);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () {
                if (_geolocationData != null) {
                  setState(() {
                    text = jsonEncode(_geolocationData!.toJson());
                  });
                }
              },
              child: const Text('toJson'),
            ),
          ],
        ),
      ),
    );
  }
}
```
