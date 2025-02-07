import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:ai_assistant/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../helper/global.dart';
import '../helper/pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode = Pref.isDarkMode.obs;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

 @override
  Widget build(BuildContext context) {

    mq = MediaQuery.sizeOf(context);

    //APIs.getAnswer('hii');
    return Scaffold(
      //app bar
      appBar: AppBar( 
        title: const Text(appName),
            //
            actions: [
              IconButton(
                padding: EdgeInsets.only(right: 10),
                  onPressed: () {
                    Get.changeThemeMode(
                      _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

                      _isDarkMode.value = !_isDarkMode.value;
                      Pref.isDarkMode = _isDarkMode.value;
                  }, 
                  icon: Obx(() => Icon(
                      _isDarkMode.value 
                      ? Icons.brightness_2_rounded
                      : Icons.brightness_4_rounded, 
                      size: 26
                    ),
                  ))
            ],
        ),
      //body
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: mq.height * .015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
       
    );
  }
}  