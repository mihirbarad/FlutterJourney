import 'package:dart_ipify/dart_ipify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:topsBudget/FireStore/Firebase_service.dart';
import 'package:topsBudget/Homepage.dart';
import 'package:topsBudget/googleSinin/auth_service.dart';
import 'package:topsBudget/loginscree.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var mobile = preferences.getString("mobile");
  final ipv4 = await Ipify.ipv4();
  print(">>>>>>>>>>>>>>>>>>>>>>>$ipv4<<<<<<<<<<<<<<<");

  final ipv6 = await Ipify.ipv64();
  print(">>>>>>>>>>>>>>>>>>>>>>>$ipv6<<<<<<<<<<<<<<<");

  final ipv4json = await Ipify.ipv64(format: Format.JSON);
  print(
      ipv4json); //{"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e"}

  runApp(MyApp(
    ip4: ipv4,
    ip6: ipv6,
  )
      //   Sizer(builder: (context, orientation, deviceType) {
      //   return MaterialApp(
      //     debugShowCheckedModeBanner: false,
      //     home: mobile == true ? Login() : Homepage(),
      //   );
      // })
      );
}

class MyApp extends StatefulWidget {
  var ip4;
  var ip6;
  MyApp({super.key, required this.ip4, required this.ip6});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool i = false;

  @override
  Future<void> getAdminName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    i = await prefs.getBool("isLogin") ?? false;
  }

  late Future myfuture;

  @override
  void initState() {
    super.initState();
    myfuture = getAdminName();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myfuture,
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? CircularProgressIndicator()
            : Sizer(builder: (context, orientation, deviceType) {
                return MaterialApp(
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                  debugShowCheckedModeBanner: false,
                  // home: i == true
                  //     ? Homepage(
                  //         person_Name: '',
                  //       )
                  //     : Login(),
                  home: AuthService().handleAuthState(widget.ip4, widget.ip6),
                );
              }));
  }
}
