import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:provider/provider.dart';
import 'provider/count_provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //tHis is intialized when run this Class
  //@override is seperated from eash other
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //function value here
    final counterPro = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 0), (timer) {
      counterPro.setCount();
    });
    enterFullScreen(FullScreenMode fullScreenMode) async {
      await FullScreen.enterFullScreen(fullScreenMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    //This Is Where widget values intialized
    final counterPro = Provider.of<CountProvider>(context, listen: false);
    print('OOP! Widget building from beginning');
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your Phone Will Be Destroyeds in',
                style: TextStyle(fontSize: 45, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Consumer<CountProvider>(builder: (context, value, child) {
                print('Only This Widget, After listen:false');
                return Text(
                  value.counter.toString() + 'sec',
                  style: TextStyle(fontSize: 64, color: Colors.white),
                );
              }),
            ],
          )),
        ),
      ),
    );
  }
}
