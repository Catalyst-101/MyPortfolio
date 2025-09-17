import 'package:flutter/material.dart';
import 'package:portfolio/desktop/screens/about_me/about_me.dart';
import 'package:portfolio/desktop/screens/contact/contact.dart';
import 'package:portfolio/desktop/screens/faqs/faqs.dart';
import 'package:portfolio/desktop/screens/home_page/home_page.dart';
import 'package:portfolio/desktop/screens/myprojects/myprojects.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA_tcrx7uP7DiBYSDTqwe2QuS7-VlRNiXM",
      authDomain: "myportfolio503774.firebaseapp.com",
      projectId: "myportfolio503774",
      storageBucket: "myportfolio503774.firebasestorage.app",
      messagingSenderId: "688680628390",
      appId: "1:688680628390:web:6d4a7de16524978d838467",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      theme: ThemeData(fontFamily: "font1"),
      title: 'Khan Bhai',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) 
      {
        Widget page;
        switch (settings.name) 
        {

          case '/faqs':
            page = FAQs();
            break;

          case '/aboutme':
            page = AboutMe();
            break;

          case '/contact':
            page = Contact();
            break;

          case '/myprojects':
            page = MyProjects();
            break;
          
          case "/":
          default:
            page = HomePage();
            break;
        }

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}