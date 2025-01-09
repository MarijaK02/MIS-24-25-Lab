import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:joke_app/providers/joke_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:joke_app/screens/favorites_jokes.dart';
import 'package:joke_app/screens/home.dart';
import 'package:joke_app/screens/jokes.dart';
import 'package:joke_app/screens/random_joke.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  final notificationSettings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true
  );

  if(notificationSettings.authorizationStatus == AuthorizationStatus.authorized){
    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) async {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print("FCM Token: $fcmToken");
    }).onError((err) {
      print(err.toString());
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        await flutterLocalNotificationsPlugin.show(
          0,
          message.notification?.title,
          message.notification?.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'your_channel_id', // Channel ID
              'your_channel_name', // Channel name
              channelDescription: 'your_channel_description', // Channel description
              importance: Importance.max,
              priority: Priority.high,
              showWhen: false,
            ),
          ),
        );
      }
    });
  }

  runApp(
    ChangeNotifierProvider(
        create: (context) => JokeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        appBarTheme: AppBarTheme(
            color: Colors.cyan[400],
            elevation: 10,
            shadowColor: Colors.black,
            foregroundColor: Colors.pink,
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 30)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context) {
          final jokeType = ModalRoute.of(context)!.settings.arguments as String;
          return Jokes(jokeType: jokeType);
        },
        '/random-joke': (context) => const RandomJoke(),
        '/favorite-jokes': (context) => const Favorites()
      },
    );
  }
}
