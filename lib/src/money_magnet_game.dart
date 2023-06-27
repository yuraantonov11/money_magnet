import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyMagnetGame extends StatefulWidget {
  const MoneyMagnetGame({Key? key}) : super(key: key);

  @override
  _MoneyMagnetGameState createState() => _MoneyMagnetGameState();
}

class _MoneyMagnetGameState extends State<MoneyMagnetGame> {
  int moneyCount = 0;
  double magnetPower = 1.0;
  double magnetRadius = 50.0;
  double magnetSpeed = 1.0;

  bool isGameStarted = false;

  void startGame() {
    setState(() {
      isGameStarted = true;
      moneyCount = 0;
      increaseMoney();
    });
  }

  void increaseMoney() {
    setState(() {
      moneyCount++;
    });
  }

  void upgradeMagnetPower() {
    setState(() {
      if (moneyCount >= 10) {
        moneyCount -= 10;
        magnetPower += 0.5;
      }
    });
  }

  void upgradeMagnetRadius() {
    setState(() {
      if (moneyCount >= 10) {
        moneyCount -= 10;
        magnetRadius += 10.0;
      }
    });
  }

  void upgradeMagnetSpeed() {
    setState(() {
      if (moneyCount >= 10) {
        moneyCount -= 10;
        magnetSpeed += 0.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Magnet'),
      ),
      body: Center(
        child: isGameStarted
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Money count: $moneyCount',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SvgPicture.asset(
              'images/magnet.svg',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Upgrade Magnet',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: upgradeMagnetPower,
                  child: Text('Upgrade Power (10)'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: upgradeMagnetRadius,
                  child: Text('Upgrade Radius (10)'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: upgradeMagnetSpeed,
                  child: Text('Upgrade Speed (10)'),
                ),
              ],
            ),
          ],
        )
            : ElevatedButton(
          onPressed: startGame,
          child: Text('Start Game'),
        ),
      ),
    );
  }
}
